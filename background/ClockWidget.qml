import QtQuick
import Quickshell
import QtQuick.Layouts
import "root:/test/conf"
import "root:/test/widgets"
import "root:/test/"

Rectangle {
    id: clockWidget
    color: "transparent"
    width: day.width + Appearence.padding.big
    height: day.height + Appearence.padding.big
    x: 100
    y: 100

    StyledText {
        id: day
        y: -60
        textFormat: Text.RichText
        font.letterSpacing: -13
        animate: true
        text: "<b><big>" + Time.dayName.toUpperCase() + "</b></big>"
        color: Colors.inverse_surface
        font.family: Appearence.font.family.oswald
        font.pixelSize: 200
        font.bold: true
        font.weight: 900
    }
    StyledText {
        id: text
        x: 10
        y: 180
        textFormat: Text.RichText
        font.letterSpacing: -8
        animate: true
        font.weight: 900
        text: "<b><big>" + Time.timeWidget + "</b></big>"
        color: Colors.primary
        font.family: Appearence.font.family.oswald
        font.pixelSize: 120
        font.bold: true
    }
    StyledText {
        id: day_month
        x: text.x + text.width + Appearence.spacing.normal
        y: 208
        textFormat: Text.RichText
        font.letterSpacing: -2
        animate: true
        font.weight: 900
        text: "<b><big>" + Time.month + "</b></big>"
        color: Colors.tertiary
        font.family: Appearence.font.family.oswald
        font.pixelSize: 60
        font.bold: true
    }
}
