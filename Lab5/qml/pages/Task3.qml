import QtQuick 2.0
import Sailfish.Silica 1.0
import "func.js" as Func

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 3")
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        property var rectanglesModel: [
            { idx: 1, name: "Белый", bgcolor: "#ffffff" },
            { idx: 2, name: "Синий", bgcolor: "#0000ff" },
            { idx: 3, name: "Черный", bgcolor: "#000000" },
            { idx: 4, name: "Красный", bgcolor: "#ff0000" },
        ]

        SilicaListView {
            anchors.fill: parent
            model: container.rectanglesModel
            delegate: Rectangle {
                color: modelData.bgcolor
                width: parent.width
                height: 200
                Text {
                    text: modelData.name
                    anchors.centerIn: parent
                    color: Func.invertColor(modelData.bgcolor, 0)
                }
            }
            spacing: 5
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 20

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task4.qml")))
        }
    }
}
