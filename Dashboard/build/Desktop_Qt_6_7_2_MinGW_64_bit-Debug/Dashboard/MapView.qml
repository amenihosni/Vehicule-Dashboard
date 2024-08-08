import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtLocation 5.15
import QtPositioning 5.15

ApplicationWindow {
    visible: true
    width: 950
    height: 760
    title: qsTr("Car Map")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
    }

    Item {
        id: mainPage
        width: parent.width
        height: parent.height

        Button {
            text: "Open Map"
            anchors.centerIn: parent
            onClicked: {
                stackView.push(mapPage) // Navigate to the map view
            }
        }

        Button {
            text: "Back to Dashboard"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                stackView.pop() // Go back to the previous page
            }
        }
    }

    Item {
        id: mapPage
        width: parent.width
        height: parent.height

        Map {
            id: map
            anchors.fill: parent
            plugin: Plugin {
                name: "esri" // You can use different plugins like "osm" or "mapbox" depending on your needs
            }
            center: QtPositioning.coordinate(37.7749, -122.4194) // Example coordinates
            zoomLevel: 12
        }

        Button {
            text: "Back"
            anchors.top: parent.top
            anchors.left: parent.left
            onClicked: {
                stackView.pop() // Return to the previous page
            }
        }
    }
}
