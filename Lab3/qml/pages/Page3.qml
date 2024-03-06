import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Button {
        id: btn
        anchors.centerIn: parent
        text: "Кнопка"
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: btn.bottom
        text: btn.down ? "Нажато" : "Не нажато"
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
    }
}

