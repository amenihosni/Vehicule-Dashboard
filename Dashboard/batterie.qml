// batterie.qml
import QtQuick 2.15

Item {
    id: battery
    width: 50
    height: 20
    property int batteryLevel: 75

    // Content of the battery component
    Image {
        source: "file:///C:/path/to/empty-battery.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        width: parent.width * (batteryLevel / 100)
        height: parent.height * 0.8
        color: batteryLevel > 20 ? "green" : "red"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        radius: 2
    }

    Text {
        text: qsTr("%1%").arg(batteryLevel)
        font.pointSize: 12
        color: "white"
        anchors.centerIn: parent
    }
}
