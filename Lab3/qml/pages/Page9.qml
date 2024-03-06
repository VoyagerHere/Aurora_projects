import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Slider {
        id: slider
        anchors.centerIn: parent
        width: 600
        label: "Ползунок"
        minimumValue: 0
        maximumValue: 100
        value: 10
        stepSize: 1
        onValueChanged: console.log(value)
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: slider.bottom
        text: "Значение: " + slider.value
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
}
