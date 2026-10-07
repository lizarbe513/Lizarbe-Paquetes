-- Reglas de ventana de Lizarbe: cada panel se abre flotante y centrado.
-- Lo carga ~/.config/hypr/lizarbe.lua (lo gestiona lizarbe-doctor).
if o and o.window then
  o.window("org.omarchy.lizarbe-escritorio", { tag = "-floating-window", float = true, center = true, size = { 1120, 760 } })
  o.window("org.omarchy.lizarbe-widgets", { tag = "-floating-window", float = true, center = true, size = { 1120, 760 } })
  o.window("org.omarchy.lizarbe-temas", { tag = "-floating-window", float = true, center = true, size = { 1280, 820 } })
  o.window("org.omarchy.lizarbe", { float = true, center = true, size = { 680, 960 } })
  o.window("org.kde.kdeconnect.app", { float = true, center = true, size = { 680, 960 } })
  o.window("org.kde.kdeconnect-indicator", { float = true, center = true, size = { 680, 960 } })

  -- La pantalla no se apaga ni se bloquea mientras se ve un vídeo:
  -- cualquier ventana a pantalla completa (YouTube, reproductores…)…
  o.window(".*", { idle_inhibit = "fullscreen" })
  -- …y los reproductores mpv y VLC mientras tienen el foco.
  o.window("^(mpv|vlc)$", { idle_inhibit = "focus" })
end
