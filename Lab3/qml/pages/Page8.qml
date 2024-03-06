import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            id: mute
            icon.source: "image://theme/icon-m-speaker-mute?"
                         + (checked ? Theme.highlightColor
                                    : Theme.primaryColor)
        }
        Label {
            text: "The sound is " + (mute.checked ? "off" : "on")
        }
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page9.qml"))
    }
}
