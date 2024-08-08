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
        updateInterval: 1000  // Mise à jour toutes les secondes
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
                source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/marker.png"  // Chemin vers votre image de marqueur
                width: 24
                height: 24
            }
        }

        // Exemple de chemin entre deux points
        MapPolyline {
            line.width: 3
            line.color: "red"
            path: [
                QtPositioning.coordinate(36.8065, 10.1815),  // Point de départ
                QtPositioning.coordinate(36.8075, 10.1905)   // Point d'arrivée
            ]
        }

        // Ajoutez d'autres marqueurs ou chemins si nécessaire
    }

    Button {
        text: "Retour"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 100
        height: 40
        onClicked: {
            root.parent.pop()
        }
    }
}
