import QtQuick
import Quickshell.Hyprland
import "conf"
import "widgets"
BarBlock {
  width: bar.width
  height: clock.height
  anchors.horizontalCenter: parent.horizontalCenter
  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton 
    onClicked: Hyprland.dispatch(`exec gnome-calendar`)
    }

    StyledText {
        animate: true
        anchors.horizontalCenter: parent.horizontalCenter
        id: clock
        text: Time.time
        font.weight: 900
        color: Colors.tertiary
        font.pixelSize: Appearence.font.size.big
    }

  }
