import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    id: root

    ClickableImageV2 {
            id: greenBox
            x: 40; y: root.height-height
            source: "../assets/box_green.png"
            text: "animation on property"
            NumberAnimation on y {
                to: 40; duration: 4000
            }
        }

    ClickableImageV2 {
        id: blueBox
        x: (root.width-width)/2; y: root.height-height
        source: "../assets/box_blue.png"
        text: "behavior on property"
        Behavior on y {
            NumberAnimation { duration: 4000 }
        }

        onClicked: y = 40
        // random y on each click
//        onClicked: y = 40+Math.random()*(205-40)
    }
}
