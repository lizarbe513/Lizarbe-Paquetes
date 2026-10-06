-- Reglas de ventana de Lizarbe: cada panel se abre flotante y centrado.
-- Lo carga ~/.config/hypr/lizarbe.lua (lo gestiona lizarbe-doctor).
if o and o.window then
  o.window("org.omarchy.lizarbe-escritorio", { tag = "-floating-window", float = true, center = true, size = { 1120, 760 } })
  o.window("org.omarchy.lizarbe-widgets", { tag = "-floating-window", float = true, center = true, size = { 1120, 760 } })
  o.window("org.omarchy.lizarbe", { float = true, center = true, size = { 680, 960 } })
  o.window("org.kde.kdeconnect.app", { float = true, center = true, size = { 680, 960 } })
end
