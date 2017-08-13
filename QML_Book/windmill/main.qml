import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Windmill")

    Image {
        id: root
        width: 640
        height: 480
        source: "qrc:/images/background.png"

        Image {
                id: pole
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "images/pole.png"
            }

            Image {
                id: wheel
                anchors.centerIn: parent
                source: "images/pinwheel.png"
                Behavior on rotation {
                            NumberAnimation {
                                duration: 1500
                            }
                }
            }

            Image {
                id: blur
                anchors.centerIn: parent
                source: "images/blur.png"
                Behavior on rotation {
                            NumberAnimation {
                                duration: 1500
                            }
                }
            }

            MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        wheel.rotation += 180
                        blur.rotation += 180
                    }

                }
    }


}
