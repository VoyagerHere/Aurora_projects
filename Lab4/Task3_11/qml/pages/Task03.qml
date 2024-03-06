
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 3")
    }

    Column {
        anchors.centerIn: parent

        Button {
            text: "Ввести текст"
            onClicked: dialog.open()
        }
        TextField {
            id: field
            text: "123"
        }
    }

    Dialog {
        id: dialog
        property alias firstTextFieldValue: firstTextField.text

        Column {
            width: parent.width
            spacing: Theme.paddingMedium
            DialogHeader { }
            TextField {
                id: firstTextField
                width: parent.width
            }
        }
        onAccepted: field.text = firstTextFieldValue
    }


    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 20

        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task04.qml")))
        }
    }
}
