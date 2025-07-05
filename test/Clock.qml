import QtQuick
import Quickshell.Hyprland
import "conf"
import "widgets"
BarBlock {
  width: 36
  height: clock.height
  anchors.horizontalCenter: parent.horizontalCenter
  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton
    onDoubleClicked: calendar.visible = false
    onClicked: Hyprland.dispatch(`exec gnome-calendar`)
    }

    Calendar {id: calendar}

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
