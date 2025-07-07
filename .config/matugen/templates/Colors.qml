
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  property string fluidBack: "#80{{colors.surface.default.hex_stripped}}"

<* for name, value in colors *>
    property string {{name}}: "{{value.default.hex}}"
<* endfor *>
}
