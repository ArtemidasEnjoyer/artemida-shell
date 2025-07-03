import QtQuick
import "root:/test/conf"

Rectangle {
  id: root

  color: "transparent"
  anchors.horizontalCenter: parent.horizontalCenter

  Behavior on color {
    ColorAnimation {
      duration: Appearence.anim.duration.large
      easing.type: Easing.BezierSpline
      easing.bezierCurve: Appearence.anim.curves.emphasized
    }
  }
}
