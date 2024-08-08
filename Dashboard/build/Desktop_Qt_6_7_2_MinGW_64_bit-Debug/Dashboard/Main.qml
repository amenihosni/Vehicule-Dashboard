import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 950
    height: 760
    title: qsTr("Dashboard")

    Loader {
        id: dashboardLoader
        anchors.fill: parent
        source: "dashboard.qml"
        onStatusChanged: {
            if (status === Loader.Error) {
                console.error("Failed to load dashboard.qml: ", dashboardLoader.status);
                errorText.visible = true;
            }
        }
    }

    Text {
        id: errorText
        text: "Error loading dashboard. Please check the file path or structure."
        visible: false
        color: "red"
        font.pixelSize: 20
        anchors.centerIn: parent
    }
}
