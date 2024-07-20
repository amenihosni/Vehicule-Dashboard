import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 950
    height: 760
    title: qsTr("dashboard")

    property int speed: 0

    Rectangle {
        anchors.fill: parent

        // Background Image
        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/Untitled-1.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: mainImage
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/images.png"
            width: 500
            height: 400
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 60
            anchors.verticalCenter: parent.verticalCenter
        }

        // Add the current date on top of images.png
        Text {
            id: dateText
            text: Qt.formatDate(new Date(), "dddd, MMMM d, yyyy")
            font.pointSize: 12
            color: "white"
            anchors.horizontalCenter: mainImage.horizontalCenter
            anchors.top: mainImage.top
            anchors.topMargin: 90
            z: 1
        }

        // Speed
        Image {
            id: speedometer
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/vitesse.png"
            width: 500
            height: 400
            anchors.verticalCenterOffset: 110
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 100
        }

        // Speed Needle
        Rectangle {
            width: 2
            height: 118
            color: "white"
            anchors.verticalCenter: speedometer.verticalCenter
             anchors.verticalCenterOffset: 50
            anchors.horizontalCenter: speedometer.horizontalCenter
            anchors.horizontalCenterOffset: 10 // Adjust this value to move the needle to the right
            transformOrigin: Item.Bottom
            rotation: -45 + (speed / 220) * 270 // Adjust rotation based on speed (0 to 220)
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/warning.png"
            width: 230
            height: 160
            anchors.verticalCenterOffset: 110
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 60
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/vehicule.png"
            width: 500
            height: 400
            anchors.verticalCenterOffset: 100
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 100
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/temperature.png"
            width: 600
            height: 480
            anchors.verticalCenterOffset: 120
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.rightMargin: -160
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/tmp.png"
            width: 600
            height: 500
            anchors.verticalCenterOffset: 260
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: -180
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/fuel.png"
            width: 550
            height: 450
            anchors.verticalCenterOffset: 170
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: -120
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/speed2.png"
            width: 800
            height: 650
            anchors.verticalCenterOffset: 130
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: -60
        }

        // Buttons to increase and decrease speed
        Row {
            spacing: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.horizontalCenter: speedometer.horizontalCenter
            Button {
                width: 30
                height: 30
                contentItem: Image {
                    source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/up.png"
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }
                background: Rectangle {
                    color: "transparent"
                }
                onClicked: {
                    speed = Math.min(220, speed + 10) // Increase speed by 10, max 220
                }
            }

            Button {
                width: 30
                height: 30
                contentItem: Image {
                    source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/down.png"
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }
                background: Rectangle {
                    color: "transparent"
                }
                onClicked: {
                    speed = Math.max(0, speed - 10) // Decrease speed by 10, min 0
                }
            }

        }
    }
}
