import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Dialog {
        id: dialog
        Column {
            anchors.fill: parent
            spacing: Theme.paddingMedium
            DialogHeader { }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                TextField {
                    id: num1
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
                TextField {
                    id: num2
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
            }
        }
        onAccepted: console.log(parseInt(num1.text) + parseInt(num2.text))
    }

    Column {
        spacing: 100
        y: 300
        x: 50


        Row {
            spacing: 30
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }
        }
    }
}
