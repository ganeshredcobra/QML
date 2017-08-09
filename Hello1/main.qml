import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
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

    Text {
        color: "#1c36f5"
        text: qsTr("Hello World")
        z: 2
        font.underline: true
        font.bold: true
        font.family: "Courier"
        styleColor: "#e10707"
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
    }

    MouseArea{
        anchors.rightMargin: 0
        anchors.bottomMargin: 13
        anchors.leftMargin: 1
        anchors.topMargin: -13
        anchors.fill: parent
        onClicked: console.log(mouseX,mouseY)
    }
}
