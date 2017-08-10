import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    id:rectBig
    visible: true
    width: 640
    height: 480
    color: "red"
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }
    Rectangle{
        id : bueRec
        width: rectBig.width/2
        height: 64
        //color: "#50FFFFFF"
        //opacity: .50
        //x:64
        //y:64
        anchors.centerIn: parent
        border.color: "#000000"
        border.width: 7
        radius: 20
        rotation:180
        gradient: Gradient {
                GradientStop { position: 0.0; color: "lightsteelblue" }
                GradientStop { position: 1.0; color: "blue" }
            }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
