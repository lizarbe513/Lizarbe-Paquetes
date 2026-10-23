-- Modo juego de Lizarbe: lizarbe-modo-juego copia este archivo a
-- ~/.local/state/omarchy/toggles/hypr/ al activarlo y lo borra al salir.
-- Omarchy carga esa carpeta después de tu configuración, así que gana mientras está activo.
hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
    allow_tearing = true,
  },

  decoration = {
    rounding = 0,
    blur = { enabled = false },
    shadow = { enabled = false },
  },

  animations = {
    enabled = false,
  },

  misc = {
    -- 2 = VRR solo en pantalla completa (3 depende de que el juego avise de su tipo de contenido).
    vrr = 2,
  },
})

-- Los juegos a pantalla completa van opacos y sin esperar al vsync (tearing).
hl.window_rule({ match = { fullscreen = true }, opaque = true, immediate = true })
