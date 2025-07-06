pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property Rounding rounding: Rounding {}
    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}
    readonly property Font font: Font {}
    readonly property Anim anim: Anim {}
    readonly property int roundingsmall: 12

    component Rounding: QtObject {
        readonly property int small: 12
        readonly property int normal: 17
        readonly property int large: 25
        readonly property int full: 1000
    }

    component Spacing: QtObject {
        readonly property int small: 7
        readonly property int normal: 12
        readonly property int big: 15
        readonly property int large: 20
    }

    component Padding: QtObject {
        readonly property int small: 4
        readonly property int normal: 8
        readonly property int big: 12
        readonly property int large: 15
    }

    component FontFamily: QtObject {
        readonly property string mono: "JetBraimsMono Nerd Font"
        readonly property string propo: "JetBrainsMono Nerd Font Propo"
        readonly property string bebas: "Bebas Neue"
    }

    component FontSize: QtObject {
        readonly property int small: 8
        readonly property int normal: 14
        readonly property int big: 18
        readonly property int large: 24
        readonly property int extra: 36
    }

    component Font: QtObject {
        readonly property FontFamily family: FontFamily {}
        readonly property FontSize size: FontSize {}
    }

    component AnimCurves: QtObject {
        readonly property list<real> emphasized: [0.05, 0, 2 / 15, 0.06, 1 / 6, 0.4, 5 / 24, 0.82, 0.25, 1, 1, 1]
        readonly property list<real> emphasizedAccel: [0.3, 0, 0.8, 0.15, 1, 1]
        readonly property list<real> emphasizedDecel: [0.05, 0.7, 0.1, 1, 1, 1]
        readonly property list<real> standard: [0.2, 0, 0, 1, 1, 1]
        readonly property list<real> standardAccel: [0.3, 0, 1, 1, 1, 1]
        readonly property list<real> standardDecel: [0, 0, 0, 1, 1, 1]
        readonly property list<real> expressiveFastSpatial: [0.42, 1.67, 0.21, 0.9, 1, 1]
        readonly property list<real> expressiveDefaultSpatial: [0.38, 1.21, 0.22, 1, 1, 1]
        readonly property list<real> expressiveEffects: [0.34, 0.8, 0.34, 1, 1, 1]
    }
    component AnimDurations: QtObject {
        readonly property int small: 200
        readonly property int normal: 400
        readonly property int large: 600
    }

    component Anim: QtObject {
        readonly property AnimCurves curves: AnimCurves {}
        readonly property AnimDurations durations: AnimDurations {}
    }
}
