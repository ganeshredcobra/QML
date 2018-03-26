import QtQuick 2.6
import QtQuick.Window 2.2
import io.qt.examples.backend 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BackEnd {
           id: backend
       }

    function appendMessage(message) {
        messageBox.text += "\n" + backend.userName + "=>" + message
        console.log()
    }

    function appendMsgBcast(uname,message) {
        messageBox.text += "\n" + uname + "=>" + message
        console.log()
    }


    Image {
        id: chatWindow
        source: "qrc:images/background.png"
        width: parent.width
        height: parent.height

        Text {
            id: messageBox
            text: qsTr("text")
            color: "white"
            anchors.fill: parent
        }

        Image {
            id: inputSel
            source: "qrc:images/lineedit.png"
            width: parent.width-(parent.width * 0.15)
            height: parent.height * .20
            anchors.bottom: chatWindow.bottom
            anchors.bottomMargin: parent.height * 0.02            
        }

        Image {
            id: sendButton
            source: "qrc:images/send.png"
            width: parent.width * 0.15
            height: inputSel.height
            anchors.bottom: chatWindow.bottom
            anchors.bottomMargin: parent.height * 0.02
            anchors.right: parent.right

            MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        //backend.userName = input.text
                        send.val = "u:"+backend.userName+";"+"m:"+input.text
                        console.log("Value recvd in qml is : "+recv.val)
                        //messageBox.text += "\n" + "=>" + recv.val
                        //appendMessage(recv.val)
//                        console.log("Value to send is : "+input.text)
//                        if(socket.active)
//                            socket.sendTextMessage(qsTr(input.text));
//                        else{
//                            socket.active = !socket.active
//                            socket.sendTextMessage(qsTr(input.text));
//                        }

                    }
                }
        }

        Connections{
            target: recv
            onMsgChanged: appendMsgBcast(recv.uname,recv.msg)
        }

        Text {
            text: "Send"
            color: "black"
            anchors.centerIn: sendButton
        }

    TextInput {
            id: input
            color: "red"
            text: "Default Text"
            width: inputSel.width-(inputSel.width * 0.15)
            height: inputSel.height
            anchors.left: inputSel.left
            anchors.top: inputSel.top
            anchors.topMargin:parent.height * 0.02
            wrapMode: TextInput.Wrap
            focus: true           
        }

    }
}
