//import QtQuick 2.0
//import Sailfish.Silica 1.0

//Page {
//    id: page
//    objectName: "mainPage"
//    allowedOrientations: Orientation.All


//    Button {
//        anchors.top: page.top
//        text: "Добавить русов"
//        onClicked: {
//            rectanglesModel.append({
//                                       idx: rectanglesModel.rowCount() + 1,

//                                   })
//        }
//    }
//    Item {
//        id: col
//        //spacing: 100
//        anchors {
//            left: parent.left; right: parent.right;
//            verticalCenter: parent.verticalCenter;
//        }
//        height: parent.height * 0.7

//        SilicaListView {
//            model: rectanglesModel
//            delegate: Rectangle {
//                color: bgcolor
//                width: parent.width
//                height: 200
//                Text {
//                    text: idx + " " + name
//                    anchors.centerIn: parent
//                    color: txtcolor
//                }
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        for (var i = 0; i < rectanglesModel.rowCount(); i++) {
//                            if (rectanglesModel.get(i).idx === idx) {
//                                rectanglesModel.remove(i)
//                            }
//                        }
//                    }
//                }
//            }
//            spacing: 5
//        }
//    }
//}


import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 2")
    }

    ListModel {
        id: rectanglesModel
        ListElement { idx: 1; name: "Nill Kiggers"; bgcolor: "#B0701C"; txtcolor: "white" }
        ListElement { idx: 2; name: "Nate Higgers"; bgcolor: "#374652"; txtcolor: "white" }
        ListElement { idx: 3; name: "Nuck Figgers"; bgcolor: "#473011"; txtcolor: "white" }
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.7

        SilicaListView {
            anchors.fill: parent
            model: rectanglesModel
            delegate: Rectangle {
                color: bgcolor
                width: parent.width
                height: 200
                Text {
                    text: idx + " " + name
                    anchors.centerIn: parent
                    color: txtcolor
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for (var i = 0; i < rectanglesModel.rowCount(); i++) {
                            if (rectanglesModel.get(i).idx === idx) {
                                rectanglesModel.remove(i)
                            }
                        }
                    }
                }
            }
            spacing: 5
        }

        Button {
            property int num: 3
            text: "Добавить"
            anchors {
                bottom: parent.top;
                horizontalCenter: parent.horizontalCenter;
            }
            onClicked: {
                rectanglesModel.append({
                                           idx: num + 1,
                                           name: "РУССКИЕ ВПЕРЁД!",
                                           bgcolor: "#FFE0C4",
                                           txtcolor: "black"
                                       })
                num++;
            }
        }
    }
}
