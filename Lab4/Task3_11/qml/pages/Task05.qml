
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 5")
    }

    Column {
        anchors.centerIn: parent

        Button {
            text: "Ввести время"
            onClicked: dialog.open()
        }
        TextField {
            id: field
            text: "123"
        }
    }

    TimePickerDialog {
        id: dialog
        onAccepted: field.text = time.toTimeString()
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task06.qml")))
        }
    }
}
