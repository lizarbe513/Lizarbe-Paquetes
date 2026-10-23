import QtQuick
import Quickshell
import Quickshell.Io
import qs.Ui

// Botón del modo juego. Toda la lógica vive en lizarbe-modo-juego; el botón
// solo lo llama y muestra el estado (el script avisa con "refresh" al cambiar).
BarWidget {
  id: root
  moduleName: "lizarbe.modo-juego"

  property bool encendido: false

  function refresh() {
    if (!statusProc.running) statusProc.running = true
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  IpcHandler {
    target: "lizarbe.modo-juego"

    function refresh(): void {
      root.broadcast("refresh")
    }
  }

  Process {
    id: statusProc
    command: ["lizarbe-modo-juego", "status"]
    onExited: function(exitCode) {
      root.encendido = exitCode === 0
    }
  }

  Component.onCompleted: refresh()

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰊗"
    active: root.encendido
    tooltipText: root.encendido ? "Modo juego: activado" : "Modo juego: desactivado"
    onPressed: function(b) {
      if (b === Qt.LeftButton && root.bar) root.bar.run("lizarbe-modo-juego toggle")
    }
  }
}
