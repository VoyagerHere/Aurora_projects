import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
//    SilicaListView {
//        anchors.fill: parent
//        PullDownMenu {
//            MenuItem { text: "Назад"
//             onClicked:{
//                 pageStack.push(Qt.resolvedUrl("task2.qml"))
//             }
//            }
//            MenuItem{text: "Вперёд"
//                onClicked: {
//                    pageStack.push(Qt.resolvedUrl("task4.qml"))
//                }
//            }
//        }
//        anchors {
//            left: parent.left; right: parent.right;
//            top: parent.height
//        }
//        height: parent.height * 0.1
//        y: parent.height * 0.1
//        header: PageHeader { title: "Navigation" }
//    }
    Column{
        anchors.top: page.verticalCenter
    }
        Label {
               width: 800
               height: 200
               id: tgt
               anchors.horizontalCenter: parent.horizontalCenter
               y: 100

               color: "red"
               font.pixelSize: 360
               horizontalAlignment: Text.AlignHCenter
               property bool swtch: false
               textFormat: Text.RichText
               text: "<i>CANADA</i>"

               ParallelAnimation {
                   id: anim1
                   running: false
                   PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 800; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "color"; from: "red"; to: "yellow"; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "scale"; from: tgt.scale; to: 0.5; duration: 1000;}
                   RotationAnimation { target: tgt; from: 0; to: 180; duration: 1000;}
                   onStopped: anim2.start()
               }

               ParallelAnimation {
                   id: anim2
                   running: false
                   PropertyAnimation { target: tgt; properties: "y"; from: 800; to: 100; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "color"; from: "yellow"; to: "blue"; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "scale"; from: 0.5; to: 1; duration: 1000;}
                   RotationAnimation { target: tgt; from: 180; to: 0; duration: 1000;}
                   onStopped: if (tgt.swtch) anim1.restart()
               }

               ParallelAnimation {
                   id: anim3
                   running: false
                   PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 100; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "color"; from: "blue"; to: "red"; duration: 1000;}
                   PropertyAnimation { target: tgt; properties: "scale"; from: tgt.scale; to: 1; duration: 1000;}
                   RotationAnimation { target: tgt; from: tgt.rotation; to: 0; duration: 1000;}
               }
           }



       state: {
           if (mouseArea.pressedButtons){
               "way"
           } else {
               "back"
           }
       }

       states: [
           State {
               name: "way"
           },
           State {
               name: "back"
           }
       ]
       MouseArea {
           id: mouseArea
           anchors.fill: parent

           onPressed: {
               anim1.restart()
               swtch = true
           }
           onReleased: {
               anim2.stop()
               anim1.stop()
               anim3.start()
               swtch = false
           }
       }

}
