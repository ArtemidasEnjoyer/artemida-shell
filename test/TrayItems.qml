pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"
import "widgets"

Rectangle {
    id: root
    required property SystemTrayItem modelData
    property var trayParent: null

    color: mouseArea.containsMouse ? Colors.surface_container : "transparent"
    radius: Appearence.rounding.full
    anchors.horizontalCenter: parent.horizontalCenter
    opacity: root.modelData.hasMenu ? 1.0 : 0.8
    height: root.width
    width: bar.width - Appearence.padding.big

    // Track if item is properly initialized
    property bool itemReady: false
    property bool iconLoaded: false

    // Smooth color transitions
    Behavior on color {
        ColorAnimation {
            duration: Appearence.anim.durations.small
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearence.anim.curves.standard
        }
    }

    // Smooth scale animation on press
    scale: mouseArea.pressed ? 0.95 : (itemReady ? 1.0 : 0.8)
    Behavior on scale {
        NumberAnimation {
            duration: Appearence.anim.durations.small
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearence.anim.curves.emphasized
        }
    }

    // Smooth opacity animation when loading
    Behavior on opacity {
        NumberAnimation {
            duration: Appearence.anim.durations.normal
            easing.bezierCurve: Appearence.anim.curves.emphasized
        }
    }

    IconImage {
        id: iconImage
        source: root.modelData.icon
        anchors.centerIn: parent
        width: parent.width  // Slightly smaller for better padding
        height: parent.height
        asynchronous: true
        
        // Handle loading states
        onStatusChanged: {
            if (status === Image.Ready) {
                root.iconLoaded = true
                loadingIndicator.visible = false
            } else if (status === Image.Loading) {
                loadingIndicator.visible = true
            } else if (status === Image.Error) {
                console.warn("Failed to load tray icon:", root.modelData.icon)
                loadingIndicator.visible = false
                fallbackIcon.visible = true
            }
        }
    }

    // Loading indicator
    Rectangle {
        id: loadingIndicator
        anchors.centerIn: parent
        width: 4
        height: 4
        radius: 2
        color: Colors.primary
        visible: false
        
        // Pulsing animation
        SequentialAnimation on opacity {
            running: loadingIndicator.visible
            loops: Animation.Infinite
            NumberAnimation { to: 0.3; duration: 600 }
            NumberAnimation { to: 1.0; duration: 600 }
        }
    }

    // Fallback icon when image fails
    StyledText {
        id: fallbackIcon
        anchors.centerIn: parent
        text: "󰍉"  // Generic app icon
        color: Colors.on_surface
        font.pixelSize: Appearence.font.size.normal
        visible: false
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        hoverEnabled: true
        
        // Only handle clicks when item is ready
        enabled: root.itemReady
        
        onClicked: event => {
            if (!root.itemReady) return
            
            try {
                if (event.button == Qt.LeftButton) {
                    root.modelData.activate()
                } else if (event.button == Qt.MiddleButton) {
                    root.modelData.secondaryActivate()
                } else if (event.button == Qt.RightButton) {
                    if (root.modelData.hasMenu) {
                        menuAnchor.open()
                    }
                }
            } catch (error) {
                console.error("Error handling tray item click:", error)
            }
        }
    }

    // Tooltip showing app name

    QsMenuAnchor {
        id: menuAnchor
        
        // Only create menu if item has one

        anchor.adjustment: PopupAdjustment.SlideX
        anchor.edges: Edges.Left
        menu: root.modelData.menu
        anchor.window: this.QsWindow.window
        anchor.gravity: Edges.Right

        anchor.rect.x: bar.width + Appearence.padding.normal
        anchor.rect.y: bar.height - (trayParent ? trayParent.height : 0)
    }

    // Initialize item when ready
    Component.onCompleted: {
        console.log("Tray item created:", root.modelData.title)
        
        // Small delay to ensure item is properly initialized
        Qt.callLater(() => {
            root.itemReady = true
        })
    }

    Component.onDestruction: {
        console.log("Tray item destroyed:", root.modelData.title)
        
        // Close menu if open
        if (menuAnchor.opened) {
            menuAnchor.close()
        }
    }

    // Monitor changes to the tray item
    Connections {
        target: root.modelData
        
        function onTitleChanged() {
            console.log("Tray item title changed:", root.modelData.title)
        }
        
        function onIconChanged() {
            console.log("Tray item icon changed")
            root.iconLoaded = false
        }
    }
}
