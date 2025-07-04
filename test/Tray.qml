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

            TrayItems {}
        }
    }

}
