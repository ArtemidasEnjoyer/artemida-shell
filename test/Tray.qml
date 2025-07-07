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
    color: "transparent"
    height: tray_column.height
    width: parent.width - Appearence.padding.small

    // Property to track if tray is initialized
    property bool trayInitialized: false
    property int visibleItemCount: 0

    Column {
        id: tray_column
        spacing: Appearence.spacing.small
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            id: items
            model: tray.trayInitialized ? SystemTray.items : null

            delegate: TrayItems {
                // Pass the tray reference to items
                property var trayParent: tray
                
                // Update visible item count
                Component.onCompleted: tray.visibleItemCount++
                Component.onDestruction: tray.visibleItemCount--
            }
        }
    }

    // Status indicator when no items (optional)
    StyledText {
        anchors.centerIn: parent
        text: "󰍉"
        color: Colors.outline
        font.pixelSize: Appearence.font.size.normal
        opacity: 0.3
        visible: tray.visibleItemCount === 0 && tray.trayInitialized
    }

    // Initialize tray when component is ready
    Component.onCompleted: {
        console.log("Tray component loaded")
        
        // Small delay to ensure SystemTray service is ready
        trayInitTimer.start()
    }

    Component.onDestruction: {
        console.log("Tray component destroyed")
        trayInitialized = false
        trayInitTimer.stop()
    }

    // Timer to initialize tray with delay
    Timer {
        id: trayInitTimer
        interval: 100  // Small delay
        repeat: false
        onTriggered: {
            tray.trayInitialized = true
            console.log("Tray initialized with", SystemTray.items.length, "items")
        }
    }

    // Monitor tray changes
    Connections {
        target: SystemTray
        
        function onItemsChanged() {
            if (tray.trayInitialized) {
                console.log("Tray items changed:", SystemTray.items.length, "items")
            }
        }
    }

    // Smooth height animation when items change
    Behavior on height {
        NumberAnimation {
            duration: Appearence.anim.durations.normal
            easing.bezierCurve: Appearence.anim.curves.emphasized
        }
    }
}
