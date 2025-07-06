import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
  screen: primary

  anchors {
    top: true
    right: true
  }

  implicitWidth: 350
  implicitHeight: 700
  color: "transparent"

  WlrLayershell.layer: WlrLayer.Bottom



}
