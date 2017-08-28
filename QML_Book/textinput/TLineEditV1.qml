import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

    Rectangle {
        width: 100; height: 100
        color: "lightsteelblue"
        border.color: "gray"

        property alias text: input.text
        property alias input: input

        TextInput {
            id: input
            anchors.fill: parent
            anchors.margins: 4
            focus: true
        }
    }


}
