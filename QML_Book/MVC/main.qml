import QtQuick 2.3
import QtQuick.Controls 1.2
import "common"


ApplicationWindow {
    visible: true
    width: 640
    height: 480   

    Column {
        spacing: 2

        Repeater {
            model: 10
            BlueBox {
                width: 120
                height: 32
                text: index
            }
        }
    }
}
