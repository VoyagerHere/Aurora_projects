import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Item {
        anchors.fill: parent
        anchors.margins: Theme.paddingLarge
        anchors.topMargin: 150

        id: dao // data access object
        property var db;

        Component.onCompleted: {
            console.log("DB constructor")
            db = LocalStorage.openDatabaseSync("notes", "1.0")

            db.transaction(function(tx) {
                tx.executeSql("CREATE TABLE IF NOT EXISTS notes (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,"
                   +"note TEXT)")
            })

            console.log("DB connected")
        }
        function getNotes(callback) {
            db.readTransaction(function(tx) {
                var result = tx.executeSql("SELECT * FROM notes;")
                callback(result.rows)
            })
        }
        function addNote(txt){
            db.transaction(function(tx) {
                tx.executeSql("INSERT INTO notes (note) "
                   +"VALUES (?);", [txt])
            })
        }
        function deleteNote(id){
            db.transaction(function(tx) {
                tx.executeSql("DELETE FROM notes WHERE id = ?;",[id])
            })
        }
        function clear(){
            db.transaction(function(tx) {
                tx.executeSql("DELETE FROM notes WHERE TRUE;")
            })
        }

        TextField{ id: input }
        Button {
            id : myBut
            anchors.top: input.bottom
            text: "Добавить"
            onClicked: {
                dao.addNote(input.text)
                myList.update()
            }
        }
        SilicaListView {
            spacing: 20
            id: myList
            anchors{
                top: myBut.bottom; bottom: parent.bottom
                left: parent.left; right: parent.right
            }

            model: ListModel { id: myModel }
            delegate: Column{
                Button {
                    text: "Заметка " + index + "\n" + model.txt //model.note
                    onClicked: {
                        dao.deleteNote(model.id)
                        myList.update()
                    }
                }
            }

            function update(){
                myModel.clear()
                dao.getNotes(function(notes) {
                    for(var i = 0; i < notes.length; i++) {
                        var note = notes.item(i)
                        //console.log("Note:", JSON.stringify(note))
                        myModel.append({id: note.id, txt: note.note})
                    }
                    //console.log("----------")
                })
            }

            Component.onCompleted: {
//                dao.clear()
//                console.log("List constructor ")
                this.update()
                console.log("List constructed", width, height)
            }
        }
    }

}
