
import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    property int counter: 0

    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("Стек: %1").arg(pageStack.depth)
    }
}
