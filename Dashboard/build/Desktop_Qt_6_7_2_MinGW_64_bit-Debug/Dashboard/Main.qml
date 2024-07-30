import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 950
    height: 760
    title: qsTr("dashboard")

    property int speed: 0
    property int batteryLevel: 75
    property int engineTemperature: 0
    property bool turningLeft: false
    property bool turningRight: false
    property bool leftSignalOn: false
    property bool rightSignalOn: false

    Timer {
        interval: 1000 // Update every second
        running: true
        repeat: true
        onTriggered: {
            speed = Math.min(220, speed + Math.floor(Math.random() * 10) + 1)
            engineTemperature = Math.min(120, engineTemperature + Math.floor(Math.random() * 3) + 1)

            // Toggle turn signals for demonstration
            if (turningLeft) {
                leftSignalOn = !leftSignalOn
            }
            if (turningRight) {
                rightSignalOn = !rightSignalOn
            }
        }
    }

    Rectangle {
        anchors.fill: parent

        // Background Image
        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/Untitled-1.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: mainImage
            source: "file:///mnt/data/image.png"
            width: 500
            height: 400
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 60
            anchors.verticalCenter: parent.verticalCenter
        }

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

        // Time Display
        Timer {
            id: timeTimer
            interval: 1000 // Update every second
            running: true
            repeat: true
            onTriggered: {
                currentTime.text = Qt.formatDateTime(new Date(), "hh:mm")
            }
        }

        Text {
            id: currentTime
            text: Qt.formatDateTime(new Date(), "hh:mm")
            font.pixelSize: 18
            font.family: "Inter"
            font.bold: Font.DemiBold
            color: "#FFFFFF"
            anchors.top: parent.top
            anchors.topMargin: 360
            anchors.horizontalCenter: parent.horizontalCenter
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
            anchors.horizontalCenterOffset: 10
            transformOrigin: Item.Bottom
            rotation: -45 + (speed / 220) * 270
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

        // Engine Temperature Needle
        Rectangle {
            width: 2
            height: 118
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 164
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -100
            anchors.leftMargin: 180
            transformOrigin: Item.Bottom
            rotation: -45 + (engineTemperature / 120) * 270
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

        // Battery State (Moved to top)
        Item {
            width: 50
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 380
            anchors.right: parent.right
            anchors.rightMargin: 30

            // Empty Battery Icon
            Image {
                source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/empty-battery.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            // Battery Level
            Rectangle {
                width: parent.width * (batteryLevel / 100)
                height: parent.height * 0.8 // Slightly smaller than the icon
                color: batteryLevel > 20 ? "green" : "red"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                radius: 2
            }

            // Battery Text
            Text {
                text: qsTr("%1%").arg(batteryLevel)
                font.pointSize: 12
                color: "white"
                anchors.centerIn: parent
            }
        }

        // Left Turn Signal (Arrow)
        Item {
            id: leftTurnSignal
            width: 50
            height: 50
            visible: turningLeft || turningRight
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.fillStyle = leftSignalOn ? "green" : "red"
                    ctx.beginPath()
                    ctx.moveTo(10, 25)
                    ctx.lineTo(30, 10)
                    ctx.lineTo(30, 20)
                    ctx.lineTo(40, 20)
                    ctx.lineTo(40, 30)
                    ctx.lineTo(30, 30)
                    ctx.lineTo(30, 40)
                    ctx.closePath()
                    ctx.fill()
                }
            }
        }

        // Right Turn Signal (Arrow)
        Item {
            id: rightTurnSignal
            width: 50
            height: 50
            visible: turningLeft || turningRight
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.fillStyle = rightSignalOn ? "green" : "red"
                    ctx.beginPath()
                    ctx.moveTo(40, 25)
                    ctx.lineTo(20, 10)
                    ctx.lineTo(20, 20)
                    ctx.lineTo(10, 20)
                    ctx.lineTo(10, 30)
                    ctx.lineTo(20, 30)
                    ctx.lineTo(20, 40)
                    ctx.closePath()
                    ctx.fill()
                }
            }
        }
    }
}
