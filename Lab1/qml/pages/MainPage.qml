import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property int counter: 0

    Text {
        text: counter
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
    }

    Button {
        text: "click"
        onClicked: counter += 1
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
    }
}
