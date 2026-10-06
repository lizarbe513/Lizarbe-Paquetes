# Lizarbe Paquetes

Paquetes de pacman de Lizarbe para Omarchy. Se instalan desde el repositorio de
Lizarbe y se actualizan con `omarchy update`.

| Paquete | Qué trae |
| :--- | :--- |
| `lizarbe-menu` | Menú de Omarchy (Escritorio, Widgets, Centro), reglas de ventana flotante, hooks y `lizarbe-doctor`. |
| `lizarbe-keyring` | Llave pública con la que están firmados los paquetes. |
| *(próximos)* | `lizarbe-ajustes`, `lizarbe-centro`, `lizarbe-tema` y el metapaquete `lizarbe`. |

## lizarbe-doctor

```bash
lizarbe-doctor          # informa de lo que está mal
lizarbe-doctor --fix    # lo arregla (menú, reglas de ventana, hooks, restos de Meca)
```

Solo toca archivos de tu usuario; avisa si hay archivos de Omarchy modificados.
Lo ejecutan solos los hooks de Omarchy después de `omarchy update` y al iniciar sesión.

## Construir un paquete

```bash
cd pkgs/lizarbe-menu
makepkg -f --nodeps
```

## Publicar una versión

```bash
tools/construir.sh          # construye todo y arma el repo firmado en ../lizarbe-repo
tools/publicar.sh "mensaje" # lo sube a GitHub; los equipos lo reciben con omarchy update
```

El repo se sirve desde `https://lizarbe513.github.io/lizarbe-repo/x86_64`. La llave de firma
vive en `~/.local/share/lizarbe/gnupg` (copia cifrada en `~/lizarbe-llave-respaldo`).

## Confiar en el repo en un equipo

```bash
sudo pacman-key --add lizarbe.gpg
sudo pacman-key --lsign-key 435B12F7E6F52DFB6CDBEF1579A043BE67879787
```

Los equipos nuevos lo reciben con `lizarbe-keyring`.
