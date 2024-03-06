import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
     width: parent.width
     height: parent.height
     ListModel { id: dataModel }
     PageHeader { title: "Курс" }

     XmlListModel {
     id: xmlListModel
     source: "https://www.cbr-xml-daily.ru/daily_utf8.xml"
     query: "//Valute"

     XmlRole { name: "Name"; query: "Name/string()" }
     XmlRole { name: "Value"; query: "Value/string()" }

         onStatusChanged: {
             if (status === XmlListModel.Ready) {
                 for (var i = 0; i < xmlListModel.count; i++) {
                 dataModel.append({ text:xmlListModel.get(i).Name, value:xmlListModel.get(i).Value.replace(',', '.')})

                 }
             }
         }
     }

    property real evalue
    property bool flag
     Column{
     anchors.topMargin: 100

     // anchors.fill: parent
     width: parent.width
     anchors.top: parent.top
     Row {
         id: r1
         width: parent.width
         // Спустить вниз относительно страницы
         //anchors.topMargin: 20
         TextField {
         id: textField1
         width: parent.width/2
         onTextChanged: {
         console.log(flag)

         if (flag===false){

         var rubleAmount = parseFloat(textField1.text)
         if (!isNaN(rubleAmount)) {
         textField2.text = (rubleAmount / evalue).toFixed(2)
        }
         }
         }
         onActiveFocusChanged: {
         if (activeFocus) {
         flag=0
         // Этот код будет выполнен при клике на текстовое поле
         console.log("Текстовое поле было кликнуто");
         }
         }

         }
         TextField {
         id: textField2
         width: parent.width/2

         onTextChanged: {
         if (flag===true){
         var rubleAmount = parseFloat(textField2.text)
         if (!isNaN(rubleAmount)) {
         textField1.text = (rubleAmount * evalue).toFixed(2)
         }

         }
         }

         onActiveFocusChanged: {
         if (activeFocus) {
         flag=1
         // Этот код будет выполнен при клике на текстовое поле
         console.log("Текстовое поле было кликнуто");
         }
         }

         }
     }
     Row{
         id: r2
         anchors.top: r1.bottom
        width: parent.width
         Text {
         id: textItem
         text:"Не выбрано"
         anchors.centerIn: parent
         color: "red" // Начальный цвет текста
         }

     }
     }

     SilicaListView {
     anchors.fill: parent
     width: parent.width
     height: parent.height * 0.5
     anchors.centerIn: parent
     // anchors.verticalCenter: parent.verticalCenter
     model: dataModel

    // delegate:ComboBox {
    // //label: "Выпадающий список"
    // description: "Описание выпадающего списка"
    // menu: ContextMenu {
    // //delegate: MenuItem { text: "первый" }
    // MenuItem {text: model.text }
    // MenuItem { text: "третий" }
    // }
    // onCurrentIndexChanged: console.log(currentIndex)
    // }

     delegate: ListItem {
         id: delegate
         Label {
             x: Theme.paddingLarge
             text: model.text
             color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor

             MouseArea {
                 anchors.fill: parent
                 onClicked: {evalue=value, console.log(evalue),textItem.text=text }
                 }
             }
         }
     }
     // }

     Button {
         text: "След. задание"
         onClicked: pageStack.push(Qt.resolvedUrl("page_4.qml"))
         anchors.bottom: parent.bottom
         anchors.right: parent.right
     }
}
