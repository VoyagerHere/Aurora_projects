import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    height: 200;
    width: 500;
    color: setColor
    property string setColor: "pink"
    property string btnText: "text"
    Button {
        height: parent.height;
        width: parent.width;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        text: btnText
    }
}
