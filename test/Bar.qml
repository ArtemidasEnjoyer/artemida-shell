import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "conf"

Scope {
    Variants {
        model: Quickshell.screens;

        PanelWindow {
            property var modelData
            screen: modelData
            id: bar
            color: Colors.surface 

            WlrLayershell.namespace: "bar"

            Behavior on color {ColorAnimation {
              duration: Appearence.anim.duration.large
            }}

            anchors {
                bottom: true
                top: true 
                left: true
                right: false
            }
            implicitWidth: 36

            ColumnLayout {
                width: parent.width 
                height: parent.height - Appearence.padding.large
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                Column{
                  id: top_section
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.top: parent.top
                  spacing: Appearence.spacing.large

                  Launcher{}
                  Workspaces{}
                  Weather {}
                }
                Column{
                  id: middle_section 
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.verticalCenter: parent.verticalCenter
                  spacing: Appearence.spacing.big

                  Clock{}

                }
                Column{
                  id: bottom_section 
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.bottom: parent.bottom
                  spacing: Appearence.spacing.big

                  Sound {}
                  Tray {}
                }

          }
        }
      }
    }


