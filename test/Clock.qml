import QtQuick
import "conf"
import "widgets"

    StyledText {
        animate: true
        anchors.horizontalCenter: parent.horizontalCenter
        id: clock
        text: Time.time
        font.weight: 900
        color: Colors.tertiary
        font.pixelSize: Appearence.font.size.big
    }
