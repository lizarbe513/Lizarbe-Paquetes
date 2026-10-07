#!/bin/bash
# Al cambiar de tema: las apps de KDE (KDE Connect) toman los colores del tema.
# Solo actúa si KDE Connect está instalado.
command -v kdeconnect-app >/dev/null && command -v lizarbe-kde-colors >/dev/null && lizarbe-kde-colors >/dev/null 2>&1
exit 0
