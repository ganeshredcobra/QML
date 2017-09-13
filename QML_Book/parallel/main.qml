import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480

    id: root

       property int duration: 3000
       property Item ufo: ufo

       Image {
           anchors.fill: parent
           source: "ufo_background.png"
       }


       ClickableImageV2 {
           id: ufo
           x: 20; y: root.height-height
           text: 'ufo'
           source: "ufo.png"
           onClicked: anim.restart()
       }

       ParallelAnimation {
           id: anim
           NumberAnimation {
               target: ufo
               properties: "y"
               to: 20
               duration: root.duration
           }
           NumberAnimation {
               target: ufo
               properties: "x"
               to: 160
               duration: root.duration
           }
       }
}
