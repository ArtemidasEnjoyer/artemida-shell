import QtQuick
import Quickshell
import QtQuick.Shapes
import Quickshell.Wayland
import "root:/test/conf"

Scope {
  Variants {
    model: Quickshell.screens
    PanelWindow {
      property var modelData
      screen: modelData
      id: background
      color: "transparent"
      WlrLayershell.layer: WlrLayer.Bottom

      anchors {
        bottom: true
        left: true
        right: true
        top: true
      }
      // Roundings {}

      ClockWidget {}
    }
  }

}
