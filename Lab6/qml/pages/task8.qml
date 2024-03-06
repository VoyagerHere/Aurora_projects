import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    ConfigurationGroup {
        id: settings
        path: "/sailfish/i18n/lc_timeformat24h_2"
        property string tf: "empty"
        property bool sw: false
        }
    Column {
        anchors.centerIn: parent
        TextField {
            width: 300
            text: ""
            onTextChanged: {
                settings.tf = text
                console.log(settings.tf)
            }
        }
        Switch{
            id: sw
            onClicked: {
                settings.sw = ! settings.sw
                console.log(settings.sw)
            }
        }
        Component.onCompleted: {
            sw.checked = settings.sw
        }
    }
}
