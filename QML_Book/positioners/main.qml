import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    DarkSquare {
        id: root
        width: 120
        height: 240

        Column {
            id: row
            anchors.centerIn: parent
            spacing: 8
            RedSquare { }
            GreenSquare { width: 96 }
            BlueSquare { }
        }
    }

}
