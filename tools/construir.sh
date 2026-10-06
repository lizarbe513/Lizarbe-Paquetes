#!/usr/bin/env bash
# Construye los paquetes y arma el repositorio firmado en ../lizarbe-repo/x86_64.
# Uso: tools/construir.sh [paquete ...]   (sin argumentos: todos los de pkgs/)
set -euo pipefail

AQUI="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO="${LIZARBE_REPO_DIR:-$AQUI/../lizarbe-repo}"
OUT="$REPO/x86_64"
export GNUPGHOME="${LIZARBE_GNUPGHOME:-$HOME/.local/share/lizarbe/gnupg}"
KEY="${LIZARBE_KEY:-435B12F7E6F52DFB6CDBEF1579A043BE67879787}"

[[ -d $REPO ]] || { echo "No existe $REPO (clona lizarbe513/lizarbe-repo ahí)." >&2; exit 1; }
mkdir -p "$OUT"

pkgs=("$@")
[[ ${#pkgs[@]} -gt 0 ]] || mapfile -t pkgs < <(cd "$AQUI/pkgs" && ls -d */ | tr -d /)

for p in "${pkgs[@]}"; do
  echo ":: Construyendo $p"
  (cd "$AQUI/pkgs/$p" && PKGDEST="$OUT" SRCDEST="${TMPDIR:-/tmp}/lizarbe-src" BUILDDIR="${TMPDIR:-/tmp}/lizarbe-build" makepkg -f --nodeps --noconfirm)
done

cd "$OUT"
# Firmar cada paquete y dejar solo la versión más nueva de cada uno.
for f in *.pkg.tar.zst; do
  [[ -f $f.sig ]] || gpg --batch --yes --detach-sign --local-user "$KEY" -o "$f.sig" "$f"
done
rm -f lizarbe.db* lizarbe.files*
repo-add --quiet --sign --key "$KEY" --new lizarbe.db.tar.gz ./*.pkg.tar.zst
# Quitar los paquetes viejos que la base de datos ya no lista.
mapfile -t vigentes < <(tar -xzOf lizarbe.db.tar.gz --wildcards '*/desc' | awk '/^%FILENAME%$/ {getline; print}')
for f in *.pkg.tar.zst; do
  [[ " ${vigentes[*]} " == *" $f "* ]] || rm -f "$f" "$f.sig"
done
# GitHub Pages no sigue enlaces simbólicos: se dejan copias.
for n in db files; do
  rm -f "lizarbe.$n" "lizarbe.$n.sig"
  cp "lizarbe.$n.tar.gz" "lizarbe.$n"
  [[ -f lizarbe.$n.tar.gz.sig ]] && cp "lizarbe.$n.tar.gz.sig" "lizarbe.$n.sig"
done
gpg --export "$KEY" > "$REPO/lizarbe.gpg"
echo ":: Repositorio listo en $OUT"
ls -1 "$OUT" | sed 's/^/   /'
