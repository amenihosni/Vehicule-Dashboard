import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    width: 950
    height: 760

    property int speed: 0
    property int batteryLevel: 75
    property int engineTemperature: 0
    property int fuelLevel: 50
    property bool turningLeft: false
    property bool turningRight: false
    property bool leftSignalOn: false
    property bool rightSignalOn: false
    property string currentTemperature: "Loading..."

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            speed = Math.min(220, speed + Math.floor(Math.random() * 10) + 1)
            engineTemperature = Math.min(120, engineTemperature + Math.floor(Math.random() * 3) + 1)
            fuelLevel = Math.max(0, fuelLevel - Math.floor(Math.random() * 2))

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

        Timer {
            id: timeTimer
            interval: 1000
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

        Text {
            id: temperatureText
            text: currentTemperature
            font.pixelSize: 17
            font.family: "Inter"
            font.bold: Font.DemiBold
            color: "#FFFFFF"
            anchors.top: currentTime.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 50
        }

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/cloud.png"
            width: 21
            height: 22
            anchors.top: temperatureText.bottom
            anchors.topMargin: -17
            anchors.left: temperatureText.left
            anchors.leftMargin: -30
            z: 1
        }


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

        Rectangle {
            width: 2
            height: 118
            color: "white"
            anchors.verticalCenter: speedometer.verticalCenter
            anchors.verticalCenterOffset: 50
            anchors.horizontalCenter: speedometer.horizontalCenter
            anchors.horizontalCenterOffset: 10
            transformOrigin: Item.Bottom
            rotation: -70 + ((speed - 20) / 200) * 170
        }

        Text {
            text: speed
            font.pixelSize: 18
            color: "white"
            anchors.horizontalCenter: speedometer.horizontalCenter
            anchors.verticalCenter: speedometer.verticalCenter
            anchors.verticalCenterOffset: 55
            anchors.horizontalCenterOffset: -30
            z: 2
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

        Image {
            source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/speed2.png"
            width: 800
            height: 650
            anchors.verticalCenterOffset: 130
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: -60
        }

        Item {
            width: 50
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 380
            anchors.right: parent.right
            anchors.rightMargin: 30

            Image {
                source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/empty-battery.png"
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

        Rectangle {
            width: 2
            height: 110
            color: "white"
            anchors.verticalCenter: speedometer.verticalCenter
            anchors.verticalCenterOffset: 58
            anchors.horizontalCenter: speedometer.horizontalCenter
            anchors.horizontalCenterOffset: -280
            transformOrigin: Item.Bottom
            rotation: -45 + ((engineTemperature / 120) * 90)
        }

        Button {
            id: cameraButton
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 40
            height: 40
            icon.source: "file:///C:/Users/ameni/OneDrive/Documents/Dashboard/camera.png"
            onClicked: {
                cameraOpener.openCamera()
            }
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
        }

        Component.onCompleted: {
            var request = new XMLHttpRequest();
            request.open("GET", "https://api.openweathermap.org/data/2.5/weather?q=Tunis,TN&appid=298c05dbc976e323a775a89d3e1bc7f5&units=metric", true);
            request.onload = function() {
                if (request.status >= 200 && request.status < 400) {
                    var response = JSON.parse(request.responseText);
                    currentTemperature = qsTr("%1°C").arg(Math.floor(response.main.temp));
                } else {
                    console.error("Error fetching data:", request.status, request.statusText);
                    currentTemperature = "Error fetching data";
                }
            };
            request.onerror = function() {
                console.error("Network error occurred");
                currentTemperature = "Error fetching data";
            };
            request.send();
        }
    }
}
