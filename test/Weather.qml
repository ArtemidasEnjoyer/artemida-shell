import QtQuick
import Quickshell
import "conf"
import "process"
import "widgets"

BarBlock {
  width: 36
  height: weather.height
  anchors.horizontalCenter: parent.horizontalCenter
  StyledText {
    id: weather
    anchors.horizontalCenter: parent.horizontalCenter
    color: Colors.inverse_surface
    font.weight: 900
    font.pixelSize: Appearence.font.size.big
    text: Process.weather
    rotation: 90
  }
}
