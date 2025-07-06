pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"

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

    IconImage {
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

    // TrayMenu {id: trayAc}

    QsMenuAnchor {
        id: menuAnchor

        anchor.adjustment: PopupAdjustment.SlideX
        anchor.edges: Edges.Left
        menu: root.modelData.menu
        anchor.window: this.QsWindow.window
        anchor.gravity: Edges.Right

        anchor.rect.x: bar.width + Appearence.padding.normal
        anchor.rect.y: bar.height - tray_column.height
    }
}
