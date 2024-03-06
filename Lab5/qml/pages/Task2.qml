import QtQuick 2.0
import Sailfish.Silica 1.0
import "func.js" as Func

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 2")
    }

    ListModel {
        id: rectanglesModel
        ListElement { idx: 1; name: "Белый"; bgcolor: "#ffffff"; }
        ListElement { idx: 2; name: "Синий"; bgcolor: "#0000ff"; }
        ListElement { idx: 3; name: "Черный"; bgcolor: "#000000"; }
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        SilicaListView {
            anchors.fill: parent
            model: rectanglesModel
            delegate: Rectangle {
                color: bgcolor
                width: parent.width
                height: 200
                Text {
                    text: idx + " " + name
                    anchors.centerIn: parent
                    color: Func.invertColor(bgcolor, 0)
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for (var i = 0; i < rectanglesModel.rowCount(); i++) {
                            if (rectanglesModel.get(i).idx === idx) {
                                rectanglesModel.remove(i)
                            }
                        }
                    }
                }
            }
            spacing: 5
        }

        Button {
            text: "Добавить"
            anchors {
                bottom: parent.bottom;
                horizontalCenter: parent.horizontalCenter;
            }
            onClicked: {
                var prev = rectanglesModel.rowCount() - 3
                prev = prev < 0 ? 0 : prev

                var newName = rectanglesModel.get(prev)
                newName = newName === undefined ? "Белый" : newName.name
                var newColor = rectanglesModel.get(prev)
                newColor = newColor === undefined ? "#fff" : newColor.bgcolor

                rectanglesModel.append({
                                           idx: rectanglesModel.rowCount() + 1,
                                           name: newName,
                                           bgcolor: newColor
                                       })
            }
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task3.qml")))
        }
    }
}
