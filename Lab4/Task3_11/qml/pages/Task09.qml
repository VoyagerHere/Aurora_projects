
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 9")
    }

    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: "Menu Item 1"
                onClicked: field.text = text
            }
            MenuItem {
                text: "Menu Item 2"
                onClicked: field.text = text
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.2
        y: parent.height * 0.2
        header: PageHeader { title: "Simple List" }
    }

    TextField {
        id: field
        text: "123"
        anchors.centerIn: parent
    }

    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "Menu Item 3"
                onClicked: field.text = text
            }
            MenuItem {
                text: "Menu Item 4"
                onClicked: field.text = text
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.2
        y: parent.height * 0.6
        header: PageHeader { title: "Simple List 2" }
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task10.qml")))
        }
    }
}
