import "root:/test/conf"
import QtQuick

Text {
  id: root

  property bool animate: false
  property string animateProp: "scale"
  property real animateFrom: 0
  property real animateTo: 1
  property int animateDuration: Appearence.anim.duration.small

  renderType: Text.NativeRendering
  anchors.fill: parent.fill
  textFormat: Text.PlainText
  color: Colors.inverse_surface
  font.family: Appearence.font.family.propo
  font.pointSize: Appearence.font.size.small

  Behavior on color {
    ColorAnimation {
      duration: Appearence.anim.duration.normal
      easing.type: Easing.BezierSpline
      easing.bezierCurve: Appearence.anim.curves.standard
    }
  }
  Behavior on text {
    enabled: root.animate

    SequentialAnimation {
      Anim {
        to: root.animateFrom
        easing.bezierCurve: Appearence.anim.curves.standardAccel
      }
      PropertyAction {}
      Anim {
        to: root.animateTo
        easing.bezierCurve: Appearence.anim.curves.standardAccel
      }
    }
  }
  component Anim: NumberAnimation {
    target: root
    property: root.animateProp
    duration: root.animateDuration / 2
    easing.type: Easing.BezierSpline
  }
}
