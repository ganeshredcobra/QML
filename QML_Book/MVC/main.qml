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
            model: ListModel {
                        ListElement { name: "Mercury"; surfaceColor: "gray" }
                        ListElement { name: "Venus"; surfaceColor: "yellow" }
                        ListElement { name: "Earth"; surfaceColor: "blue" }
                        ListElement { name: "Mars"; surfaceColor: "orange" }
                        ListElement { name: "Jupiter"; surfaceColor: "orange" }
                        ListElement { name: "Saturn"; surfaceColor: "yellow" }
                        ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
                        ListElement { name: "Neptune"; surfaceColor: "lightBlue" }
                    }
            //model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]
            //model: 10
            BlueBox {
                width: 120
                height: 32

                radius: 3
                text: name

                Box {
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 4

                      width: 16
                      height: 16

                      radius: 8

                      color: surfaceColor
                     }
            }
        }
    }
}
