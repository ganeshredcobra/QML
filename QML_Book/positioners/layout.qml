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
        height: 50
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
    GreenSquare {
                id:secondrow
               y: one.height+20
               width: 100
               height: 100
               BlueSquare {
                   id: blue1
                   width: 48; height: 24
                   y: 8
                   anchors.horizontalCenter: parent.horizontalCenter
               }
               BlueSquare {
                   id: blue2
                   width: 72; height: 24
                   anchors.top: blue1.bottom
                   anchors.topMargin: 4
                   anchors.horizontalCenter: blue1.horizontalCenter
                   Text {
                       text: "(4)"
                   }
               }
           }
    GreenSquare {
                x:secondrow.width
                y:secondrow.y
                width: 100
                height: 100
                BlueSquare {
                    width: 48
                    anchors.centerIn: parent
                    Text {
                        text: "(5)"
                    }
                }
            }

    GreenSquare {
        x:secondrow.width*2
        y:secondrow.y
        width: 100
        height: 100
               BlueSquare {
                   width: 48
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.horizontalCenterOffset: -12
                   anchors.verticalCenter: parent.verticalCenter
                   Text {
                       text: "(6)"
                   }
               }
           }



    }
}
