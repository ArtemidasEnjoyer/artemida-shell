import QtQuick
import Quickshell
import QtQuick.Layouts
import "root:/test/conf"
import "root:/test/widgets"
import "root:/test/"

Rectangle {
    id: clockWidget
    color: "transparent"
    width: day.width
    height: day.height
    x: 100
    y: 100

    StyledText {
        id: day
        y: -60
        textFormat: Text.RichText
        font.letterSpacing: -13
        animate: true
        text: "<b><big>" + Time.dayName + "</b></big>"
        color: Colors.inverse_surface
        font.family: Appearence.font.family.bebas
        font.pixelSize: 200
        font.bold: true
        font.weight: 900
    }
    StyledText {
        id: text
        x: 10
        y: 140
        textFormat: Text.RichText
        font.letterSpacing: -10
        animate: true
        font.weight: 900
        text: "<b><big>" + Time.timeWidget + "</b></big>"
        color: Colors.primary
        font.family: Appearence.font.family.bebas
        font.pixelSize: 120
        font.bold: true
    }
    StyledText {
        id: day_month
        x: 230
        y: 160
        textFormat: Text.RichText
        font.letterSpacing: -2
        animate: true
        font.weight: 900
        text: "<b><big>" + Time.month + "</b></big>"
        color: Colors.tertiary
        font.family: Appearence.font.family.bebas
        font.pixelSize: 60
        font.bold: true
    }
}
