import QtQuick 2.9
import QtQuick.Controls 2.2
import QtSensors 5.9

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    property int accelX: 0
    property int accelY: 0


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Accel X is : "+accelX+" Accel Y is : "+accelY)
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }

    Accelerometer {
               id: accel
               dataRate: 100
               active: true

               onReadingChanged: {
                   accelX = calcRoll(accel.reading.x, accel.reading.y, accel.reading.z)
                   accelY = calcPitch(accel.reading.x, accel.reading.y, accel.reading.z)

                   //console.log("Accel Vals are : "+newX+" , "+newY)
               }
           }

            function calcPitch(x, y, z) {
                return -(Math.atan(y / Math.sqrt(x * x + z * z)) * 57.2957795);
            }
            function calcRoll(x, y, z) {
                return -(Math.atan(x / Math.sqrt(y * y + z * z)) * 57.2957795);
            }
}
