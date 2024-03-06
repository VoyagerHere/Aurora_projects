
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Страница 3")
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Label {
            text: qsTr("Глубина стека: %1").arg(pageStack.depth)
        }
    }
}
