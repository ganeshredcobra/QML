import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    Item {
        // set width based on given background
        width: bg.width
        height: bg.height

        Image { // nice background image
            id: bg
            source: "qrc:/../assets/background.png"
        }

        MouseArea {
            id: backgroundClicker
            // needs to be before the images as order matters
            // otherwise this mousearea would be before the other elements
            // and consume the mouse events
            anchors.fill: parent
            onClicked: {
                // reset our little scene
                circle.x = 84
                box.rotation = 0
                triangle.rotation = 0
                triangle.scale = 1.0
            }
        }

        ClickableImage {
            id: circle
            x: 84; y: 68
            source: "qrc:/../assets/circle_blue.png"
            antialiasing: true
            onClicked: {
                // increase the x-position on click
                x += 20
            }
        }

        ClickableImage {
            id: box
            x: 164; y: 68
            source: "qrc:/../assets/box_green.png"
            antialiasing: true
            onClicked: {
                // increase the rotation on click
                rotation += 15
            }
        }

        ClickableImage {
            id: triangle
            x: 248; y: 68
            source: "qrc:/../assets/triangle_red.png"
            antialiasing: true
            onClicked: {
                // several transformations
                rotation += 15
                scale += 0.05
            }
        }

        function _test_transformed() {
            circle.x += 20
            box.rotation = 15
            triangle.scale = 1.2
            triangle.rotation = -15
        }

        function _test_overlap() {
            circle.x += 40
            box.rotation = 15
            triangle.scale = 2.0
            triangle.rotation = 45
        }
}
}
