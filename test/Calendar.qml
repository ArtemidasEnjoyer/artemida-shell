import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "conf"

PopupWindow {
    id: calendar
    anchor.window: bar
    anchor.rect.y: parentWindow.height / 2 - calendar.width / 3
    anchor.rect.x: parentWindow.width * 1.25
    implicitWidth: dateWidget.width + 40
    implicitHeight: dateWidget.height
    visible: false
    color: "transparent"

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.fill: parent
        radius: Appearence.rounding.normal
        color: Colors.surface
        opacity: 1
        Keys.onEscapePressed: calendar.visible = false

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: calendar.visible = false
        }

        ColumnLayout {
            id: dateWidget
            anchors.centerIn: parent
            Keys.onPressed: calendar.visible = false
            DayOfWeekRow {
                locale: grid.locale

                Layout.column: 1
                Layout.fillWidth: true

                delegate: Text {
                    text: shortName
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font: Appearnece.font.family.propo
                    color: Colors.primary
                }
            }

            // WeekNumberColumn {
            //   month: grid.month
            //   year: grid.year
            //   locale: grid.locale
            //
            //   Layout.fillHeight: true
            //   delegate: Text {
            //     text: weekNumber
            //     horizontalAlignment: Text.AlignHCenter
            //     verticalAlignment: Text.AlignVCenter
            //     font: Appearnece.font.family.propo
            //     color: Colors.tertiary
            //
            //     required property int weekNumber
            //   }
            // }

            MonthGrid {
                id: grid
                month: Calendar.July
                year: 2025
                locale: Qt.locale("en_US")

                Layout.fillWidth: true
                Layout.fillHeight: true

                delegate: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: model.month === grid.month ? 1 : 0
                    text: grid.locale.toString(model.date, "d")
                    font: Appearence.font.family.propo
                    color: Colors.inverse_surface

                    required property var model
                }
            }
        }
    }
}
