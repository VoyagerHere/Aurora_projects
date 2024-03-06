import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TextField {
        anchors.centerIn: parent
        description: "Ввод числа"
        placeholderText: "Number"
        inputMethodHints: Qt.ImhDigitsOnly
        horizontalAlignment: Text.AlignHCenter
        validator: IntValidator{}
    }
    Button {
        anchors.left: parent.left
        text: "Next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
    }
}
