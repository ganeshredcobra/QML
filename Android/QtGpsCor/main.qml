import QtQuick 2.9
import QtQuick.Controls 2.2
import QtPositioning 5.8
import QtLocation 5.9

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    property var coord: 0

    PositionSource {
        id: src
        updateInterval: 1000
        active: true

        onPositionChanged: {
            coord = src.position.coordinate;
            console.log("Coordinate:", coord.longitude, coord.latitude);
        }
    }

    function request() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                    print('HEADERS_RECEIVED')
                } else if(xhr.readyState === XMLHttpRequest.DONE) {
                    print('DONE')
                    var json = JSON.parse(xhr.responseText.toString())
                    view.model = json.items
                }
            }
            xhr.open("GET", "http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=munich");
            xhr.send();
        }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            button.onClicked: {
                // This is available in all editors.
                request()
                console.log()
}
            Text {
                text: "Coordinate Latitude : "+coord.longitude+"\n"+" Coordinate Longitude : "+coord.latitude
               }
        }

        Page2Form {
            //Label.text: "Hello Text"
            Plugin {
                   id: mapPlugin
                   name: "osm" // "mapboxgl", "esri", ...
                   // specify plugin parameters if necessary
                   // PluginParameter {
                   //     name:
                   //     value:
                   // }
               }
               /*
               Map {
                   id:map
                   anchors.fill: parent
                   plugin: mapPlugin
                   //zoomLevel: (maximumZoomLevel - minimumZoomLevel)/2
                   //center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                   center {
                           // The Qt Company in Oslo
                           latitude: coord.latitude
                           longitude: coord.longitude
                       }

                   zoomLevel: 14
                   MapQuickItem {
                       id: marker
                       anchorPoint.x: image.width/4
                       anchorPoint.y: image.height

                       sourceItem: Image {
                           id: image
                           source: "map-marker-icon.png"
                       }
                   }

               }
                */

            Map {
                id: map
                anchors.fill: parent
                plugin: mapPlugin;
                center {
                        // The Qt Company in Oslo
                        latitude: coord.latitude
                        longitude: coord.longitude
                    }
                zoomLevel: 18

                MapQuickItem {
                    id: marker
                    coordinate: QtPositioning.coordinate(coord.latitude, coord.longitude)
                    anchorPoint.x: image.width/4
                    anchorPoint.y: image.height

                    sourceItem: Image {
                        id: image
                        width: 50
                        height: 50
                        source: "map-marker-icon.png"
                    }
                }
            }



        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("GPS Cor")
        }
        TabButton {
            text: qsTr("Map View")
        }
    }
}
