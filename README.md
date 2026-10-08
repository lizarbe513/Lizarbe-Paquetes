# Lizarbe Paquetes

Paquetes de pacman de Lizarbe para Omarchy. Se instalan desde el repositorio firmado
`https://lizarbe513.github.io/lizarbe-repo/x86_64` (ya viene configurado en la ISO de Lizarbe)
y se actualizan con `omarchy update`.

| Paquete | Origen | Qué trae |
| :--- | :--- | :--- |
| `lizarbe` | aquí | Metapaquete: instala todo lo de abajo. |
| `lizarbe-menu` | aquí | Entradas de Lizarbe en el menú de Omarchy (ES/EN), reglas de ventana, hooks de Omarchy (entre ellos el que abre la Bienvenida en el primer inicio), `lizarbe-doctor`, `lizarbe-menu-sync`, KDE Connect. |
| `lizarbe-ajustes` | [Lizarbe-Ajustes](https://github.com/lizarbe513/Lizarbe-Ajustes) | **Escritorio**, **Widgets**, **Estudio de temas**, **Tienda** y **Bienvenida** (TUIs en Rust). |
| `lizarbe-centro` | [Lizarbe-Omarchy-Config](https://github.com/lizarbe513/Lizarbe-Omarchy-Config) | **Centro Lizarbe** (`lizarbe`): identidad, suites de software y actualizaciones. |
| `lizarbe-tema` | [Lizarbe-Omarchy-Config](https://github.com/lizarbe513/Lizarbe-Omarchy-Config) | Temas `lizarbe`, `lizarbe-light` y `lizarbe-arena`, iconos, GTK, branding, fastfetch y starship. |
| `lizarbe-keyring` | aquí | Llave pública con la que se firman los paquetes. |

Los paquetes que salen de otro repositorio se construyen desde su etiqueta `vX.Y.Z`
(`source=git+…#tag=v$pkgver`): primero se etiqueta allí, luego se sube `pkgver` aquí.

## lizarbe-doctor

```bash
lizarbe-doctor          # informa de lo que está mal
lizarbe-doctor --fix    # lo arregla (menú, reglas de ventana, hooks, restos de versiones viejas)
```

Comprueba el menú, las reglas de ventana, los hooks, las aplicaciones de Lizarbe, el bloque de
capturas de `~/.config/uwsm/env` y que no queden restos de Meca o de instalaciones antiguas en
`~/.local/bin`. Solo toca archivos de tu usuario (con copia de seguridad) y avisa si hay archivos
de Omarchy modificados. Lo ejecutan solos los hooks de Omarchy después de `omarchy update` y al
iniciar sesión.

## Publicar una versión

```bash
tools/construir.sh [paquete …]   # construye (todos si no se indica) y arma el repo firmado en ../lizarbe-repo
tools/publicar.sh "mensaje"      # lo sube a GitHub; los equipos lo reciben con omarchy update
```

Cada paquete construido se vuelve a firmar siempre. La llave de firma vive en
`~/.local/share/lizarbe/gnupg` (copia cifrada en `~/lizarbe-llave-respaldo`).

## Confiar en el repo en un equipo

Los equipos instalados con la ISO ya lo tienen (`lizarbe-keyring`). A mano:

```bash
sudo pacman-key --add lizarbe.gpg
sudo pacman-key --lsign-key 435B12F7E6F52DFB6CDBEF1579A043BE67879787
```
