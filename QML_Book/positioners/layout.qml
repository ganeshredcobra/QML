import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

    GreenSquare {
        BlueSquare {
            width: 12
            anchors.fill: parent
            anchors.margins: 8
            Text {
                text: "(1)"
            }
        }
    }
}
