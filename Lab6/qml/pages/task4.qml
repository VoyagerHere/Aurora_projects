import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "//Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
    }
        SilicaListView {
            anchors.fill: parent
            header: PageHeader { title: "Prohibited money" }
            model: xmlListModel
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: Text { text: Value; }
        }
}
