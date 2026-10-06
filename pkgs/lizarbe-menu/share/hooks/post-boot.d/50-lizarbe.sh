#!/bin/bash
# Al iniciar sesión: si una actualización o un reinicio de Omarchy deshizo algo
# de Lizarbe (por ejemplo la carga de sus reglas), lo repone.
command -v lizarbe-doctor >/dev/null && lizarbe-doctor --fix --quiet
exit 0
