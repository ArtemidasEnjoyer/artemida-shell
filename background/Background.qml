import QtQuick
import Quickshell
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
      // Rectangle {
      //   width: 500
      //   height: 500
      //   anchors.verticalCenter: parent.verticalCenter
      //   anchors.horizontalCenter: parent.horizontalCenter
      //   color: Colors.primary 
      // }
      ClockWidget {}
    }
  }

}
