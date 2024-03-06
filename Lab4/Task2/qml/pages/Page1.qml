
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Первая страница")
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Прикрепить"
            onClicked: pageStack.pushAttached(Qt.resolvedUrl(qsTr("Page2.qml")))
        }
        Button {
            text: "Открепить"
            onClicked: pageStack.popAttached()
        }
    }
}
