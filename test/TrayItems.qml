pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"
import "widgets"

            Rectangle {
              id: root 
              required property SystemTrayItem modelData

                color: "transparent"
                radius: Appearence.rounding.big
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: root.modelData.hasMenu ? 1.0 : 0.8 
                height: 20
                width: 20
                // Appear animation

                IconImage{
                    source: root.modelData.icon
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
                                       root.modelData.activate();
                                   } else if (event.button == Qt.MiddleButton) {
                                       root.modelData.secondaryActivate();
                                   } else if (event.button == Qt.RightButton) {
                                       menuAnchor.open();
                                   }
                               }
                             }

                QsMenuAnchor {
                    id: menuAnchor

                    menu: root.modelData.menu
                    anchor.window: this.QsWindow.window
                    anchor.adjustment: PopupAdjustment.flip

                    anchor.onAnchoring: {
                        const window = mouseTrayArea.QsWindow.window;
                        const widgetRect = window.contentItem.mapFromItem(mouseTrayArea, 0, mouseTrayArea.height, mouseTrayArea.width, mouseTrayArea.height);

                        menuAnchor.anchor.rect = widgetRect;
                    }

                }
            }
