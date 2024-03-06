import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
   property var dataModel: [
       { color: "white", text: "Белый" },
       { color: "blue",  text: "Синий" },
       { color: "red", text: "Красный" }
   ]
   SilicaListView {
       anchors.fill: parent
       header: PageHeader { title: "JavaScript Russian Flag" }
       model: dataModel
       delegate: Rectangle {
           width: parent.width
           height: 100
           color: modelData.color
           Text {
               anchors.centerIn: parent
               text: modelData.text || "USA"
           }
       }
   }
}
