#!/usr/bin/env bash
# Sube el repositorio firmado a GitHub (lizarbe513/lizarbe-repo, con Pages).
# Uso: tools/publicar.sh ["mensaje"]
set -euo pipefail

AQUI="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO="${LIZARBE_REPO_DIR:-$AQUI/../lizarbe-repo}"
MSG="${1:-Actualizar paquetes}"

cd "$REPO"
git add -A
if git diff --cached --quiet; then
  echo "Nada nuevo que publicar."
  exit 0
fi
git commit -q -m "$MSG"
git push -q
echo "Publicado. Los equipos lo recibirán en su próximo omarchy update."
