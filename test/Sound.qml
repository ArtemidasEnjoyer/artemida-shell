import QtQuick
import Quickshell.Hyprland
import "conf"
import "widgets"
import "process"

BarBlock {
    // implicitWidth: sounds.implicitWidth
    
    property string soundIcon: Audio.volume >= 0.9 ? "" : Audio.volume >= 0.6 ? "" : Audio.volume > 0 ? "" : "" 
    height: sounds.height 
    width: bar.width 
    anchors.horizontalCenter: parent.horizontalCenter

    MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch(`exec pavucontrol`)
            onWheel: wheel => {
                if (wheel.angleDelta.y > 0) {
                    Audio.volumeIncrease()
                    // console.log("volume increase")
                  } 
                if (wheel.angleDelta.y < 0) {
                    Audio.volumeDecrease()
                    // console.log("volume decrease")
                }
            }
        }




    StyledText {
        id: sounds
        anchors.fill: parent.fill
        font.pixelSize: Appearence.font.size.big
        color: Audio.volume >= 0.6 ? Colors.primary : Audio.volume > 0 ? Colors.secondary : Colors.tertiary
        text: soundIcon
        anchors.horizontalCenter: parent.horizontalCenter

            }
}
