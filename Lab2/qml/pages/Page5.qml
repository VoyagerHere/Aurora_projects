import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        spacing: 100
        y: 300
        x: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 400

            Rectangle {
                id: black
                width: 200
                height: 200
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter

                ParallelAnimation {
                    running: true
                    NumberAnimation {
                        target: black
                        property: "y"
                        to: 150
                        duration: 800
                        loops: Animation.Infinite
                    }
                    NumberAnimation {
                        target: black
                        property: "scale"
                        to: 2
                        duration: 800
                        loops: Animation.Infinite
                    }
                }
            }
        }
        Row {
            spacing: 30
            Button {
                text: "Back"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Next"
                onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
            }
        }
    }

}
