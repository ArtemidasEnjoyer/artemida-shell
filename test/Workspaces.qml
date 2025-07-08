import QtQuick
import Quickshell.Hyprland
import "conf"
import "widgets"

BarBlock {
    id: workspacesContainer
    radius: Appearence.rounding.full
    anchors.horizontalCenter: parent.horizontalCenter
    width: 36
    height: workspacesItem.height

    Column {
        id: workspacesItem
        spacing: Appearence.spacing.small
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                id: indicator
                width: 12
                height: modelData.focused ? 24 : 12
                radius: Appearence.rounding.full
                anchors.horizontalCenter: parent.horizontalCenter
                scale: modelData.focused ? 1.1 : 1.0
                color: modelData.focused ? Colors.inverse_surface : Colors.secondary_fixed_dim
                opacity: modelData.focused ? 1 : 0.5
                antialiasing: true

                // Smooth gradient for focused workspace
                Rectangle {
                    id: gradientOverlay
                    anchors.fill: parent
                    radius: Appearence.rounding.full
                    opacity: modelData.focused ? 1 : 0
                    antialiasing: true
                    
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: Colors.primary }
                        GradientStop { position: 1.0; color: Colors.secondary}
                    }
                    
                    Behavior on opacity {
                        NumberAnimation {
                            duration: Appearence.anim.durations.normal
                            easing.bezierCurve: Appearence.anim.curves.emphasized
                        }
                    }
                }

                // Smooth color transitions
                Behavior on color {
                    ColorAnimation {
                        duration: Appearence.anim.durations.normal
                        easing.bezierCurve: Appearence.anim.curves.emphasized
                    }
                }
                
                // Bouncy scale animation
                Behavior on scale {
                    NumberAnimation {
                        duration: Appearence.anim.durations.small
                        easing.bezierCurve: Appearence.anim.curves.expressiveFastSpatial
                    }
                }
                
                // Smooth opacity transitions
                Behavior on opacity {
                    NumberAnimation {
                        duration: Appearence.anim.durations.small
                        easing.bezierCurve: Appearence.anim.curves.emphasized
                    }
                }
                
                // Smooth height animation with bounce
                Behavior on height {
                    NumberAnimation {
                        duration: Appearence.anim.durations.normal
                        easing.bezierCurve: Appearence.anim.curves.expressiveDefaultSpatial
                    }
                }

                // Hover effect
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: modelData.activate()
                    onPressAndHold: {
                        if (modelData.id > 0) {
                            Hyprland.dispatch(`movetoworkspace ${modelData.id}`);
                        }
                    }
                    
                    onEntered: {
                        if (!modelData.focused) {
                            indicator.scale = 1.05;
                            indicator.opacity = 0.8;
                        }
                    }
                    
                    onExited: {
                        if (!modelData.focused) {
                            indicator.scale = 1.0;
                            indicator.opacity = 0.5;
                        }
                    }
                }
            }
        }

        Connections {
            target: Hyprland
            function onFocusedWorkspaceChange() {
                Hyprland.refreshWorkspaces();
            }
        }

        Component.onCompleted: Hyprland.refreshWorkspaces()
    }
    
    MouseArea {
        anchors.fill: parent
        onWheel: wheel => {
            if (wheel.angleDelta.y > 0) {
                Hyprland.dispatch(`workspace e-1`);
            }
            if (wheel.angleDelta.y < 0) {
                Hyprland.dispatch(`workspace e+1`);
            }
        }
    }
}
