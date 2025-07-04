import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland
import "root:/test/conf"

PanelWindow {
  anchors {
    top: false
    bottom: true
  }
  WlrLayershell.layer: WlrLayer.Bottom

  implicitWidth: 800
  implicitHeight: 600
  color: Colors.surface

  ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    Repeater {
      model: DesktopEntries.applications
      Rectangle {
        color: "transparent"
        Text {
          anchors.left: parent.left
          color: Colors.inverse_surface
          text: modelData.name
        }
        Image {
          anchors.right: parent.right
          width: 32
          height: width
          source: modelData.icon
        }
      }

    }
  }


}
