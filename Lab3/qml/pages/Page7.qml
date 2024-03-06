import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ComboBox {
        anchors.centerIn: parent
        label: "Выпадающий список"
        description: "Описание"
        menu: ContextMenu {
            MenuItem { text: "Элемент 1" }
            MenuItem { text: "Элемент 2" }
            MenuItem { text: "Элемент 3" }
        }
        onCurrentIndexChanged: console.log(value)
    }

    Button {
        anchors.left: parent.left
        text: "Back"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page8.qml"))
    }
}
