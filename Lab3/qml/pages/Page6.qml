import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TimePicker {
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        id: timePicker
        hourMode: DateTime.TwelveHours
        onTimeTextChanged: console.log(this.time)
    }

    Label {
        anchors.centerIn: parent
        text: timePicker.hour + ":" + timePicker.minute
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
    }
}
