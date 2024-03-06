import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    DatePicker {
        anchors.centerIn: parent
        date: new Date()
        onDateTextChanged: console.log(this.date)
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
    }
}
