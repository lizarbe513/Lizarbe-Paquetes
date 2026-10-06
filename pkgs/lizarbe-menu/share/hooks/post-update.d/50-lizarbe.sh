#!/bin/bash
# Tras `omarchy update`: deja el menú, las reglas y los hooks de Lizarbe en orden.
command -v lizarbe-doctor >/dev/null && lizarbe-doctor --fix --quiet
exit 0
