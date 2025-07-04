import QtQuick
import Quickshell
import Quickshell.Hyprland
import "conf"
import "widgets"


BarBlock {
  radius: Appearence.rounding.full
  id: workspacesContainer
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
                width:  12
                height: modelData.focused ? 24 : 12
                radius: Appearence.rounding.full
                anchors.horizontalCenter: parent.horizontalCenter
                scale: modelData.focused ? 1.1 : 1.0
                color: modelData.focused ? Colors.inverse_surface: Colors.secondary_fixed_dim
                opacity: modelData.focused ? 1 : 0.5
                antialiasing: true
                Behavior on color {ColorAnimation { duration: Appearence.anim.duration.small; easing.type: Easing.InOutQuad}}
                Behavior on scale {NumberAnimation {duration: Appearence.anim.duration.small; easing.type: Easing.InOutQuad}}
                Behavior on opacity {NumberAnimation {duration: Appearence.anim.duration.small; easing.type: Easing.InOutQuad}}
                Behavior on height {NumberAnimation {duration: Appearence.anim.duration.small; easing.bezierCurve: Appearence.anim.curves.emphasized}}

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                    onPressAndHold: {
                        if (modelData.id > 0) {
                            Hyprland.dispatch(`movetoworkspace ${modelData.id}`)
                        }
                    }
                }
            }
        }

        Connections {
            target: Hyprland
            function onFocusedWorkspaceChange() {
                hyprland.refreshWorkspaces()
            }
        }

        Component.onCompleted: Hyprland.refreshWorkspaces()

    }
    MouseArea {
        anchors.fill: parent
        onWheel: wheel => {
                     if (wheel.angleDelta.y > 0)
                     {Hyprland.dispatch(`workspace e+1`)}
                     if (wheel.angleDelta.y < 0)
                     {Hyprland.dispatch(`workspace e-1`)}
                 }

    }
}

