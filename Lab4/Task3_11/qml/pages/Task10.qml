
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 10")
    }

    SilicaListView {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.8
        model: 20
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "List Item #" + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel { text: "Context Menu" }
                MenuItem {
                    text: "Menu Item 1"
                    onClicked: console.log("Menu Item 1 is clicked", index)
                }
                MenuItem {
                    text: "Menu Item 2"
                    onClicked: console.log("Menu Item 2 is clicked", index)
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
    }
}
