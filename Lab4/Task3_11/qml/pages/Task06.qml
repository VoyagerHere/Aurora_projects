
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 6")
    }

    ListModel {
        id: tasksModel
        ListElement { desc: "Помыть посуду"; date: "07.01.21"; }
        ListElement { desc: "Сделать лабы"; date: "07.01.21"; }
        ListElement { desc: "Погулять"; date: "09.01.21"; }
        ListElement { desc: "Поспать"; date: "12.01.21"; }
    }

    Item {
        anchors.centerIn: parent
        width: 500
        height: 700
        SilicaListView {
            anchors.fill: parent
            model: tasksModel
            header: PageHeader { title: "Список дел" }
            section {
                property: 'date'
                delegate: SectionHeader { text: section }
            }
            delegate: Text { text: desc }
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task07.qml")))
        }
    }
}
