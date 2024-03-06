import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        spacing: 100
        y: 300
        x: 150

        Item {
            width: 500
            height: 300

            Rectangle {
                id: red
                width: 200
                height: 200
                color: ""
            }

            Rectangle {
                id: greed
                width: 200
                height: 200
                color: "lightgreen"
                anchors.top: red.verticalCenter
                anchors.left: red.right
            }

            Rectangle {
                id: blue
                width: 200
                height: 200
                color: "blue"
                anchors.left: greed.horizontalCenter
                anchors.bottom: greed.verticalCenter
            }

            Text {
                text: "Квадрат"
                color: "white"
                anchors.centerIn: blue
                font.pointSize: 25
            }
        }

        Row {
            Button {
                text: "Next"
                onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
            }
        }
    }
}
