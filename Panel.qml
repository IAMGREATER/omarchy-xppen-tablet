import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy-xppen-tablet"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: launcher
    command: ["xppen-config-gui"]
  }

  function toggle() {
    launcher.running = true
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf1fc" // Paint brush / pen icon
    tooltipText: "XP-Pen Tablet Settings"
    onPressed: function(buttonCode) {
      root.toggle()
    }
  }
}
