import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

    /*DarkSquare {
        id: root
        width: 120
        height: 240

        Column {
            id: column
            anchors.centerIn: parent
            spacing: 8
            RedSquare { }
            GreenSquare { width: 96 }
            BlueSquare { }
        }
    }*/

    BrightSquare {
        id: roqsqr
        width: 400; height: 120

        Row {
            id: row
            anchors.centerIn: parent
            spacing: 20
            BlueSquare { }
            GreenSquare { }
            RedSquare { }
        }
    }


}
