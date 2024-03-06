import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ListModel {
        id: dataModel
        ListElement { color: "white"; text: "Белый"; }
        ListElement { color: "blue";  text: "Синий" }
        ListElement { color: "red"; text: "Красный"}
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: "Russian flag" }
        model: dataModel
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: model.color
            Text {
                anchors.centerIn: parent
                text: model.text
            }
        }
    }
}
