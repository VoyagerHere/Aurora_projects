import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        Counter {
            id: counter
            count: 10;
        }

        Column {
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            PageHeader {
                title: qsTr("Счетчик")
            }

            Label {
                id: label;
                anchors.horizontalCenter: parent.horizontalCenter
                text: counter.getCount();
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Сгенирировать"
                onClicked: {
                    counter.inc();
                    label.text = counter.getCount();
                }
            }

            Grid {
                spacing: 10
                columns: 2

                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "sin"
                    onClicked: {
                        label.text = counter.getSin();
                    }
                }

                Button {

                    text: "cos"
                    onClicked: {
                        label.text = counter.getCos();
                    }
                }

                Button {
                    text: "tan"
                    onClicked: {
                        label.text = counter.getTan();
                    }
                }

                Button {
                    text: "cot"
                    onClicked: {
                        label.text = counter.getCot();
                    }
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Обнулить"
                onClicked: {
                    counter.reset();
                    label.text = counter.getCount();
                }
            }
        }

        PushUpMenu {
            MenuItem {
                text: "Задание 2"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page2.qml"))
            }
        }
    }
}
