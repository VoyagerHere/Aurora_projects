import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("COOL LAB 6")
    }

    ConfigurationValue {
        id: setting_1
        key: "/sailfish/i18n/lc_timeformat24h"
        defaultValue: "Нет настроек"
    }
    ConfigurationValue {
        id: setting_2
        key: "/sailfish/i18n/lc_timeformat24h_1"
        defaultValue: false
    }


    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingLarge
        anchors.topMargin: 150
        spacing: Theme.paddingMedium

        Label{
            width: parent.width
            text: "Сохранить текст в настройках"
        }

        TextField {
            width: parent.width
            onTextChanged: {
                setting_1.value = text
                console.log(setting_1.value)
            }
        }
        Switch{
            id: sw
            onClicked: {
                setting_2.value = ! setting_2.value
                console.log(setting_2.value)
            }
        }

        Button {
            text: "Печать text"
            onClicked: console.log(setting_1.value)
        }
        Button {
            text: "Печать switch"
            onClicked: console.log(setting_2.value)
        }
        Component.onCompleted: {
            sw.checked = setting_2.value
        }
    }
}
