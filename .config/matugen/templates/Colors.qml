
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

<* for name, value in colors *>
    property string {{name}}: "{{value.default.hex}}"
<* endfor *>
}
