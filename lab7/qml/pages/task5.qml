import QtQuick 2.0
import Sailfish.Silica 1.0
Page{
    SilicaListView {
        anchors.fill: parent
        PullDownMenu {
            MenuItem { text: "Назад"
             onClicked:{
                 pageStack.push(Qt.resolvedUrl("task4.qml"))
             }
            }
            MenuItem{text: "Вперёд"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("task5.qml"))
                }
            }
        }
        anchors {
            left: parent.left; right: parent.right;
            top: parent.height
        }
        height: parent.height * 0.1
        y: parent.height * 0.1
        header: PageHeader { title: "Navigation" }
    }
    Column {
               anchors.centerIn: parent

               MyButton {
                   id: myButton;
                   anchors.centerIn: parent.Center
                   Label {
                       anchors.top: parent.top
                       text: "Да разве это вопрос?"
                   }
                   setColor: "pink"
               }
           }
}
