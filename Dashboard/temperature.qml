import QtQuick 2.15

Item {
    id: temperature
    width: 600
    height: 480
    property int engineTemperature: 0

    Image {
        source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/temperature.png"
        anchors.fill: parent
    }

    Rectangle {
        width: 2
        height: 67
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 190
        anchors.left: parent.left
        anchors.leftMargin: 140
        transformOrigin: Item.Bottom
        rotation: -90 + (engineTemperature / 120) * 90
    }
}
