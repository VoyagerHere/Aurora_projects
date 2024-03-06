import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        spacing: 100
        y: 300
        x: 50

        Item {
            width: 350
            height: 200

            Row {
                spacing: 200

                Rectangle {
                    width: 200
                    height: 200
                    color: "black"
                }

                Rectangle {
                    width: 200
                    height: 200
                    color: "black"
                    transform: [
                        Scale {
                            xScale: 0.5
                        },
                        Rotation {
                            angle: 45
                        }
                    ]
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
                onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
            }
        }
    }

}
