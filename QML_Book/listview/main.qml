import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    Background {
        width: 80
        height: 300

        ListView {
            anchors.fill: parent
            anchors.margins: 20

            clip: true

            model: 100

            delegate: numberDelegate
            spacing: 5
        }

        Component {
            id: numberDelegate

            GreenBox {
                width: 40
                height: 40
                text: index
            }
        }
    }
}
