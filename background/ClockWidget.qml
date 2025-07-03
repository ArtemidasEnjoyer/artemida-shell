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
        y: -60
        textFormat: Text.RichText
        font.letterSpacing: -13
        animate: true
        id: day
        text: "<b><big>" +Time.dayName+  "</b></big>"
        color: Colors.inverse_surface
        font.family: Appearence.font.family.bebas
        font.pixelSize: 200
        font.bold: true
        font.weight: 900
    }
    StyledText {
        x: 10
        y: 140
        textFormat: Text.RichText
        font.letterSpacing: -10
        animate: true
        id: text
        font.weight: 900
        text: "<b><big>" + Time.timeWidget  + "</b></big>"
        color: Colors.primary
        font.family: Appearence.font.family.bebas
        font.pixelSize: 120
        font.bold: true
    }
    StyledText {
        x: 230
        y: 160
        textFormat: Text.RichText
        font.letterSpacing:-2 
        animate: true
        id: day_month
        font.weight: 900
        text: "<b><big>" + Time.month + "</b></big>"
        color: Colors.tertiary
        font.family: Appearence.font.family.bebas
        font.pixelSize: 60
        font.bold: true
    }

}


