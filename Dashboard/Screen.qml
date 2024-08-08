import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: splash
    width: 950
    height: 760

    Rectangle {
        anchors.fill: parent
        color: "black"

        Column {
            id: splashContent
            anchors.centerIn: parent
            spacing: 30

            Text {
                id: splashText
                text: "Bienvenue"
                color: "white"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id: logo
                source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/logo.png"
                width: 355
                height: 100
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: loadingText
                text: "Loading..."
                color: "grey"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Timer {
            id: splashTimer
            interval: 3000
            running: true
            repeat: false
            onTriggered: {
                splash.visible = false
                dashboardLoader.source = "dashboard.qml"
            }
        }
    }
}
