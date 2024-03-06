import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 4")
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        XmlListModel {
            id: xmlListModel
            source: "http://www.cbr.ru/scripts/XML_daily.asp"
            query: "//Valute"
            XmlRole { name: "Name"; query: "Name/string()" }
            XmlRole { name: "Value"; query: "Value/string()" }
        }

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: Text { text: Value; }
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
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task5.qml")))
        }
    }
}
