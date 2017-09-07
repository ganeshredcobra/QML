import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true

    ClickableImageV2 {
            id: greenBox
            x: 40; y: root.height-height
            source: "../assets/box_green.png"
            text: "animation on property"
            NumberAnimation on y {
                to: 40; duration: 4000
            }
        }
}
