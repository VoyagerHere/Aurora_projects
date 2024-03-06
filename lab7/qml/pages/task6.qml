import QtQuick 2.0
import Sailfish.Silica 1.0
Page{
    SilicaListView {
        anchors.fill: parent
        PullDownMenu {
            MenuItem { text: "Назад"
             onClicked:{
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
               Row {
                   anchors.centerIn: parent.Center
                   spacing: 5

                   id: row
                   property int count: 0

                   MyCounter {
                       num: parseInt(row.count / 60 / 60)
                   }
                   MyCounter {
                       num: parseInt(row.count / 60)
                   }
                   MyCounter {
                       num: row.count % 60
                   }
               }

               Button {
                   anchors.horizontalCenter: parent.horizontalCenter
                   width: 200
                   height: 100
                   text: "Старт"
                   onClicked: {
                       timer.running = !timer.running
                       text = text === "Старт" ? "Пауза" : "Старт"
                   }
               }
           }

           Timer {
               id: timer
               interval: 1000
               repeat: true
               running: false
               onTriggered: {
                   row.count++
               }
           }
}
