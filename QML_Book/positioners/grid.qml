import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

BrightSquare {
    id: root
    width: 160
    height: 160

    Grid {
        id: grid
        rows: 2
        columns: 2
        anchors.centerIn: parent
        spacing: 8
        RedSquare { }
        RedSquare { }
        RedSquare { }
        RedSquare { }
    }

    Flow {
           anchors.fill: parent
           anchors.margins: 20
           spacing: 20
           RedSquare { }
           BlueSquare { }
           GreenSquare { }
       }

}

}
