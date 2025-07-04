import QtQuick
import QtQuick.Controls
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
                MouseArea {
                    id: mouseTrayArea
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                    hoverEnabled: true
                    onClicked: event => {
                                   if (event.button == Qt.LeftButton) {
                                       modelData.activate();
                                   } else if (event.button == Qt.MiddleButton) {
                                       modelData.secondaryActivate();
                                   } else if (event.button == Qt.RightButton) {
                                       menuAnchor.open();
                                   }
                               }
                             }

                QsMenuAnchor {
                    id: menuAnchor

                    menu: modelData.menu
                    anchor.window: mouseTrayArea.QsWindow.window
                    anchor.adjustment: PopupAdjustment.flip

                    anchor.onAnchoring: {
                        const window = mouseTrayArea.QsWindow.window;
                        const widgetRect = window.contentItem.mapFromItem(mouseTrayArea, 0, mouseTrayArea.height, mouseTrayArea.width, mouseTrayArea.height);

                        menuAnchor.anchor.rect = widgetRect;
                    }

                }
            }

        }
    }

}
