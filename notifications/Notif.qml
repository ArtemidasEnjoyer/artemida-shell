import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.Notifications
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
