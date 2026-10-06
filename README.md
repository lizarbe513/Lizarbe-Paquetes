# Lizarbe Paquetes

Paquetes de pacman de Lizarbe para Omarchy. Se instalan desde el repositorio de
Lizarbe y se actualizan con `omarchy update`.

| Paquete | Qué trae |
| :--- | :--- |
| `lizarbe-menu` | Menú de Omarchy (Escritorio, Widgets, Centro), reglas de ventana flotante, hooks y `lizarbe-doctor`. |
| *(próximos)* | `lizarbe-ajustes`, `lizarbe-centro`, `lizarbe-tema`, `lizarbe-keyring` y el metapaquete `lizarbe`. |

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
