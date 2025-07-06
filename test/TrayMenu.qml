pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"
import "widgets"

Rectangle {
    id: root
    required property SystemTrayItem modelData
    implicitWidth: trayMenu.width
    implicitHeight: trayMenu.height

    QsMenuOpener {
        id: trayMenuOpener
        menu: root.modelData.menu
    }
}
