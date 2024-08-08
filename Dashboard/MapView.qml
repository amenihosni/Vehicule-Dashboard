import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15  // Import for map functionalities
import QtPositioning 5.15

Rectangle {
    width: 950
    height: 760

    PositionSource {
        id: positionSource
        active: true
        updateInterval: 1000  // Update every second
        onPositionChanged: {
            map.center = positionSource.position.coordinate
            marker.coordinate = positionSource.position.coordinate
        }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: Plugin {
            name: "osm"  // OpenStreetMap plugin
        }
        center: QtPositioning.coordinate(36.8065, 10.1815)
        zoomLevel: 14

        MapQuickItem {
            id: marker
            coordinate: QtPositioning.coordinate(36.8065, 10.1815)
            anchorPoint.x: 12
            anchorPoint.y: 12
            sourceItem: Image {
                source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/marker.png"  // Path to your marker image
                width: 24
                height: 24
            }
        }

        // Example path between two points
        MapPolyline {
            line.width: 3
            line.color: "red"
            path: [
                QtPositioning.coordinate(36.8065, 10.1815),  // Starting point
                QtPositioning.coordinate(36.8075, 10.1905)   // Ending point
            ]
        }

        // Add other markers or paths if needed
    }

    Button {
        text: "Open Google Maps"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 150
        height: 40
        onClicked: {
            Qt.callLater(function() {
                Qt.openUrlExternally("https://www.google.com/maps")
            })
        }
    }

    Button {
        text: "Retour"
        anchors.bottom: parent.bottom
        anchors.left: openGoogleMapsButton.right
        width: 100
        height: 40
        onClicked: {
            root.parent.pop()
        }
    }
}
