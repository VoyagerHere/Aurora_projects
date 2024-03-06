import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Button {
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Зажимание"
        onClicked: down = !down
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
    }
}
