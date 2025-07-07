import QtQuick
import Quickshell
import "conf"
import "process"
import "widgets"

BarBlock {
    width: 36
    height: weather.height
    anchors.horizontalCenter: parent.horizontalCenter
    
    StyledText {
        id: weather
        anchors.horizontalCenter: parent.horizontalCenter
        color: Colors.inverse_surface
        font.weight: 900
        font.pixelSize: Appearence.font.size.big
        text: WeatherGet.weatherData // Use the new WeatherData singleton
        font.family: Appearence.font.family.propo
        
        // Optional: Add loading indicator
        opacity: WeatherGet.loading ? 0.5 : 1.0
        
        Behavior on opacity {
            NumberAnimation {
                duration: Appearence.anim.durations.small
                easing.bezierCurve: Appearence.anim.curves.standard
            }
        }
    }
}
