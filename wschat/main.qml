import QtQuick 2.6
import QtQuick.Window 2.2
import QtWebSockets 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function appendMessage(message) {
        messageBox.text += "\n" + "=>" + message
    }

    Image {
        id: chatWindow
        source: "qrc:images/background.png"
        width: parent.width
        height: parent.height



        WebSocketServer {
            id: server
            listen: true
            port: 3000
            onClientConnected: {
                webSocket.onTextMessageReceived.connect(function(message) {
                    appendMessage(qsTr("Server received message: %1").arg(message));
                    webSocket.sendTextMessage(qsTr("Hello Client!"));
                });
            }
            onErrorStringChanged: {
                appendMessage(qsTr("Server error: %1").arg(errorString));
            }
         }

        WebSocket {
            id: socket
            url: "ws://127.0.0.1:3000"
            onTextMessageReceived: appendMessage(qsTr("Client received message: %1").arg(message))
            onStatusChanged: {
                if (socket.status == WebSocket.Error) {
                    appendMessage(qsTr("Client error: %1").arg(socket.errorString));
                } else if (socket.status == WebSocket.Closed) {
                    appendMessage(qsTr("Client socket closed."));
                }else if (socket.status == WebSocket.Open) {
                    console.log("Socket open");
                    //socket.sendTextMessage("Hello G")
                }
            }
        }


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
                        console.log("Value to send is : "+input.text)
                        if(socket.active)
                            socket.sendTextMessage(qsTr(input.text));
                        else{
                            socket.active = !socket.active
                            socket.sendTextMessage(qsTr(input.text));
                        }

                    }
                }
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
