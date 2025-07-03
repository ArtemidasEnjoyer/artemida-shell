pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "root:/test/widgets"

Singleton {
  
  id: root
  property string weather
  Process {
    id: weatherSc
    running: true
    command: ["bash","-c","/home/artsiom/.config/quickshell/test/process/weather.sh"]
    
    stdout: StdioCollector {
      onStreamFinished: root.weather = this.text 
    }
  }
  Timer {
    interval: 30000
    running: true
    repeat: true
    onTriggered: weatherSc.running = true
  }
}
