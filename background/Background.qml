import QtQuick
import Quickshell
import QtQuick.Shapes
import Quickshell.Wayland
import "root:/test/conf"

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: background
            property var modelData
            screen: modelData
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Bottom

            anchors {
                bottom: true
                left: true
                right: true
                top: true
            }
            // Roundings {}

            ClockWidget {}
        }
    }
}
