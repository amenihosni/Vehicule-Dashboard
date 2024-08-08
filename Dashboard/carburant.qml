import QtQuick 2.15

Item {
    id: fuel
    width: 550
    height: 450
    property int fuelLevel: 50

    Image {
        source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/fuel.png"
        anchors.fill: parent
    }

    Rectangle {
        width: 2
        height: 63
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 184
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 328
        anchors.rightMargin: 180
        transformOrigin: Item.Bottom
        rotation: -45 + (fuelLevel / 100) * 270
    }
}
