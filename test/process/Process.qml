pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string weather
    property string year
    property string month
    property string day

    Process {
        id: weatherSc
        running: true
        command: ["bash", "-c", "/home/artsiom/.config/quickshell/test/process/weather.sh"]

        stdout: StdioCollector {
            onStreamFinished: root.weather = this.text
        }
      }
      Process {
        id: yearNow
        running: true
        command: ["date","+%Y"]
        stdout: StdioCollector {
          onStreamFinished: root.year = this.text
        }
      }
        Process {
          id: monthNow
          running: true
          command: ["date","+%B"]
          stdout: StdioCollector {
            onStreamFinished: root.month = this.text
          }
      }
      Process {
        id: dayNow
        running: true
        command: ["date","+%e"]
        stdout: StdioCollector {
          onStreamFinished: root.day = this.text
        }
      }

      Timer {
        interval: 60000
        running: true
        repeat: true
        onTriggered: dayNow.running = true
    }
    



    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: weatherSc.running = true
    }
}
