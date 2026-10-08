#!/bin/bash
# Muestra la Bienvenida de Lizarbe una sola vez, en el primer inicio de un usuario
# nuevo. La marca ~/.config/lizarbe/bienvenida-pendiente la siembra /etc/skel (y la
# ISO); la propia Bienvenida la quita al terminar, salvo que se pida volver a verla.
marca="$HOME/.config/lizarbe/bienvenida-pendiente"
[[ -f $marca ]] || exit 0
command -v lizarbe-bienvenida >/dev/null || exit 0

# Fuera del hook para no frenar a los demás: espera a que Omarchy termine su
# propio primer inicio (avisos de Wi-Fi y de atajos) y abre la Bienvenida.
(
  for _ in $(seq 1 25); do
    omarchy-done check first-run-user 2>/dev/null && break
    sleep 1
  done
  sleep 3
  [[ -f $marca ]] || exit 0
  omarchy-launch-or-focus-tui --app-id=org.omarchy.lizarbe-bienvenida lizarbe-bienvenida
) >/dev/null 2>&1 &
exit 0
