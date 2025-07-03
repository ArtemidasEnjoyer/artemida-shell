pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "hh\nmm")
  } 
  readonly property string dayName: {
    Qt.formatDateTime(clock.date, "dddd")
  }
  readonly property string timeWidget: {
    Qt.formatDateTime(clock.date, "hh:mm")
  }
  readonly property string month: {
    Qt.formatDateTime(clock.date, "dd MMM")
  }

  

  SystemClock {
    id: clock 
    precision: SystemClock.Minutes
  }
}
