import QtQuick
import Quickshell
import "root:/test/conf"
import "root:/test/widgets"
import Quickshell.Io

FloatingWindow {

  implicitWidth: 500
  implicitHeight: 500

  StyledRectangle {
    width: parent.width - Appearence.padding.small
    height: parent.height - Appearence.padding.small
  }
  
}
