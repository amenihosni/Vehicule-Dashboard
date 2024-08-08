import QtQuick 2.15

Item {
    id: speedometer
    width: 500
    height: 400
    property int speed: 0

    Image {
        source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/vitesse.png"
        anchors.fill: parent
    }

    Rectangle {
        width: 2
        height: 118
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 10
        transformOrigin: Item.Bottom
        rotation: -70 + ((speed - 20) / 200) * 170
    }

    Text {
        text: speed
        font.pixelSize: 18
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 55
        anchors.horizontalCenterOffset: -30
        z: 2
    }
}
