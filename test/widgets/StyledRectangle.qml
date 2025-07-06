import QtQuick
import Quickshell
import "root:/test/conf"

Rectangle {
    id: root

    color: "transparent"

    Behavior on color {
        ColorAnimation {
            duration: Appearence.anim.duration.large
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearence.anim.curves.emphasized
        }
    }
}
