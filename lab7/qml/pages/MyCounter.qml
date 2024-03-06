import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    width: 200
    height: 200

    property string num: "0"

    Label {
        text: num
        anchors.centerIn: parent
        color: "black"
    }
}
