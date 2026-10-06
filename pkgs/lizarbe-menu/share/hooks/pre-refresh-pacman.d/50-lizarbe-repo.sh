#!/bin/bash
# `omarchy refresh pacman` reescribe /etc/pacman.conf y se perdería el repo de
# Lizarbe. Se vuelve a añadir antes de que pacman actualice. Corre como tu
# usuario con sudo ya autorizado (ver add-custom-repo.sample de Omarchy).
CONF=/etc/pacman.conf
SNIPPET=/etc/pacman.d/lizarbe.conf
MARKER="Include = $SNIPPET"

[[ -r $SNIPPET ]] || exit 0
grep -qxF "$MARKER" "$CONF" && exit 0

sudo sed -i "0,/^\[core\]/s||$MARKER\n\n[core]|" "$CONF"
