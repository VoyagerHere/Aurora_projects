
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 8")
    }

    ListModel {
        id: tasksModel
        ListElement { desc: "Помыть посуду"; date: "07.01.21"; }
        ListElement { desc: "Сделать лабы"; date: "07.01.21"; }
        ListElement { desc: "Погулять"; date: "09.01.21"; }
        ListElement { desc: "Поспать"; date: "12.01.21"; }
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        SlideshowView {
            id: view
            anchors.centerIn: parent
            height: width
            itemHeight: width; itemWidth: width;
            model: tasksModel
            delegate: Rectangle {
                width: view.itemWidth;
                height: view.itemHeight;
                Text {
                    anchors {
                        top: parent.top;
                        right: parent.right;
                    }
                    text: date
                }
                Text {
                    anchors.centerIn: parent
                    text: desc
                }
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task09.qml")))
        }
    }
}
