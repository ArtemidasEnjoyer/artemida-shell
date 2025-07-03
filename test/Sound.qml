import QtQuick
import "conf"
import "widgets"
import Quickshell.Services.Pipewire
import "process"

BarBlock {
  // implicitWidth: sounds.implicitWidth 
  height: sounds.height
  width: 36
  anchors.horizontalCenter: parent.verticalCenter

  StyledText {
    id: sounds
    rotation: 90
    anchors.fill: parent.fill
    font.pixelSize: Appearence.font.size.big
    font.weight: 700
    color: Audio.volume ? Colors.primary : Colors.tertiary
    anchors.horizontalCenter: parent.horizontalCenter
    text: Math.round(Audio.volume*100) + "%"

    MouseArea {
      anchors.fill: parent.fill
      onWheel: wheel => {
        if (wheel.angleDelta.y > 0 ) {
          Pipewire.defaultAudioSink.audio.volume = volume + 0.1 
        } else if (wheel.angleDelta.y < 0 ) {
          Pipewire.defaultAudioSink.audio.volume = volume - 0.1
        }
  }
  }
      }
    
    
    
}
  


