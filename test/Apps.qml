import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
  implicitWidth: 300
  model: DesktopEntry.icon
  Image {
    width:  32
    height: 32
  }
}
