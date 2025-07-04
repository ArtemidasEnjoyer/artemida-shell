pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "conf"
import "widgets"

StackView {
  id: root
  required property Item popouts
  required property QsMenuHandle trayItem


  implicitWidth: currentItem.implicitWidth
  implicitHeight: currentItem.implicitHeight

  initialItem: SubMenu {
    handle: root.trayItem
  }

    component SubMenu: Column {
        id: menu
        required property QsMenuHandle handle
        property bool isSubMenu
        property bool shown

        padding: Appearence.padding.small
        spacing: Appearence.spacing.small

        opacity: shown ? 1 : 0
        scale: shown ? 1 : 0.8

        Component.onCompleted: shown = true
        StackView.onActivating: shown = true
        StackView.onDeactivating: shown = false
        StackView.onRemoved: destroy()

        QsMenuOpener {
          id: menuOpener
          menu: menu.handle
        }

        Repeater {
          model: menuOpener.children
          StyledRectangle {
            id: item

            required property QsMenuEntry modelData

            implicitWidth: 100
            implicitHeight: modelData.isSeparator ? 1 : children.implicitHeight
            radius: Appearence.rounding.full
            color: Colors.on_primary_fixed

            Loader {
              
            }
          }
        }
    }

}
