import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    // The root element is the Rectangle
    Rectangle {
        // name this element root
        id: root

        // properties: <name>: <value>
        width: parent.width; height: parent.height

        // color property
        color: "#4A4A4A"

        // Declare a nested element (child of root)
        Image {
            id: triangle

            // reference the parent
            x: (parent.width - width)/2; y: 40

            source: 'triangle_red.png'

            MouseArea {
                        id: area
                        width: parent.width
                        height: parent.height
                        onClicked: triangle.visible = !triangle.visible
                    }
        }

        // Another child of root
        Text {
            // (1) identifier
                    id: thisLabel

                    // (2) set x- and y-position
                    //x: 24; y: 16

                    // (3) bind height to 2 * width
                    height: 2 * width

                    // (4) custom property
                    property int times: 24

                    // (5) property alias
                    property alias anotherTimes: thisLabel.times

                    // (6) set text appended by value
                   // text: "Greetings " + times

                    // (7) font is a grouped property
                    font.family: "Ubuntu"
                    font.pixelSize: 24

                    // (8) KeyNavigation is an attached property
                    KeyNavigation.tab: otherLabel

                    // (9) signal handler for property changes
                    onHeightChanged: console.log('height:', height)

                    // focus is need to receive key events
                    focus: true

                    // change color based on focus value
                    color: focus?"red":"black"


//            // reference element by id
            y: triangle.y + triangle.height + 20

//            // reference root element
//            width: root.width

//            color: 'white'
           horizontalAlignment: Text.AlignHCenter
//            text: 'Triangle'

           // custom counter property for space presses
                   property int spacePresses: 0

                   text: "Space pressed: " + spacePresses + " times"

                   // (1) handler for text changes
                   onTextChanged: console.log("text changed to:", text)


                   // (2) handler with some JS
                   Keys.onSpacePressed: {
                       increment()
                   }

                   // clear the text on escape
                   Keys.onEscapePressed: {
                       thisLabel.text = ''
                   }

                   // (3) a JS function
                   function increment() {
                       spacePresses = spacePresses + 1
                   }


        }

        Rectangle {
            id: button
            // export button properties
            property alias text: label.text
            signal clicked

            width: 116; height: 26
            color: "lightsteelblue"
            border.color: "slategrey"

            Text {
                id: label
                anchors.centerIn: parent
                text: "Start"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    label.clicked()
                }
            }
        }
    }
}
