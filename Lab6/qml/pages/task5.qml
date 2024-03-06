import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    function loadMoney() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://www.cbr-xml-daily.ru/daily_utf8.xml', true);
        //xhr.setRequestHeader('Content-type', "text/plain")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                xmlListModel.xml = xhr.responseText;
            }
        }
        xhr.send();
    }

    XmlListModel {
        id: xmlListModel
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Name/string()"; }
        XmlRole { name: "Value"; query: "Value/string()"; }
    }

    SilicaListView {
        anchors.fill: parent
        model: xmlListModel
        header: PageHeader { title: "XMLHttpRequest money" }
        section {
            property: 'Name'
            delegate: SectionHeader { text: section }
        }
        delegate: Text { text: Value; }
        Component.onCompleted: {
            loadMoney()
        }
    }
}
