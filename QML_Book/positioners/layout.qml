import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    height: 640
    width: 480

    DarkSquare{
    anchors.fill: parent

    GreenSquare {
        id: one
        width: 50
        BlueSquare {
            width: 12
            anchors.fill: parent
            anchors.margins: 8
            Text {
                text: "(1)"
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: console.log(width)
        }
    }

    GreenSquare {
         x: one.width
               BlueSquare {
                   width: 48
                   y: 13
                   anchors.left: parent.left
                   anchors.leftMargin: 8
                   Text {
                       text: "(2)"
                   }
               }
           }
    GreenSquare {
        x:one.width*2
                BlueSquare {
                    width: 48
                    anchors.left: parent.right
                    Text {
                        text: "(3)"
                    }
                }
            }


    }
}
