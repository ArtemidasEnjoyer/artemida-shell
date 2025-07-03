import QtQuick
import "conf"
import "widgets"

BarBlock {
  anchors.horizontalCenter: parent.horizontalCenter
  height: launcherText.height
  width: launcherText.width 

  StyledText {
    id: launcherText
    text: ""
    color: Colors.primary
    font.pixelSize: Appearence.font.size.big
    anchors.horizontalCenter: parent.horizontalCenter
  }
}
