import QtQuick
import Quickshell.Hyprland
import "conf"
import "widgets"

BarBlock {
  anchors.horizontalCenter: parent.horizontalCenter
  height: launcherText.height
  width: launcherText.width 

  MouseArea {
    anchors.fill: parent
    onClicked: Hyprland.dispatch(`exec ~/.config/rofi/launcher.sh`)
  }

  StyledText {
    id: launcherText
    text: "󰆧"
    color: Colors.primary
    font.pixelSize: Appearence.font.size.large
    anchors.horizontalCenter: parent.horizontalCenter
  }
}
