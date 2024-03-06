import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Button {
        property int counter: 0
        id: btn
        anchors.centerIn: parent
        text: "Счетчик"
        onClicked: counter++
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: btn.bottom
        text: btn.counter
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
    }
}
