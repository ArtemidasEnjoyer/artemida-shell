import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"
import "widgets"

BarBlock {
    id: tray
    radius: Appearence.rounding.small
    color:  "transparent"
    height: tray_column.height
    width: parent.width - Appearence.padding.small

    Column {
        id: tray_column
        spacing: Appearence.spacing.small
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            id: items
            model: SystemTray.items
            width: 16
            height: 16

            Rectangle {
                color: "transparent"
                radius: Appearence.rounding.big
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: modelData.hasMenu ? 1.0 : 0.8 
                height: 20
                width: 20
                // Appear animation

                IconImage{
                    source: modelData.icon
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height
                    antialiasing: true
                    asynchronous: true
                }
                // MouseArea {
                //   anchors.fill: parent.fill
                //   acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                //   onClicked: mouse => {
                //     if (mouse.button === Qt.LeftButton) {
                //       modelData.activate()
                //     } else if (mouse.button === Qt.MiddleButton) {
                //       modelData.secondaryActivate()
                //     } else if (mouse.button === Qt.RightButton && model.hasMenu) {
                //       modelData(parent, mouse.x, mouse.y)
                //     }
                //
                //   }
                //
                //   onWheel: wheel => {
                //     model.scroll(wheel.angleDelta.y, false)
                //   }
                // }
            }

        }
    }

}
