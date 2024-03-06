import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "Gomoku"

    property bool isBlackTurn: true
    property var board: []

    Component.onCompleted: {
        initializeBoard();
    }

    function initializeBoard() {
        for (var i = 0; i < 15; i++) {
            board[i] = [];
            for (var j = 0; j < 15; j++) {
                board[i][j] = 0; // 0: empty, 1: black, 2: white
            }
        }
    }

    Grid {
        id: gameGrid
        columns: 15
        rows: 15
        spacing: 4
        anchors.centerIn: parent

        Repeater {
            model: 225
            delegate: Rectangle {
                id: gameCell
                width: 40
                height: 40
                color: "lightgray"
                border.color: "black"
                border.width: 1

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var row = Math.floor(index / 15);
                        var column = index % 15;
                        console.log("Cell clicked: Row " + row + ", Column " + column);
                        if (board[column][row] === 0) {
                            board[column][row] = isBlackTurn ? 1 : 2;
                            color = isBlackTurn ? "black" : "white";
                            if(checkWin(column, row, isBlackTurn ? 1 : 2)){
                                console.log("Win");
                                endGameScreen.visible = true;
                                winText.text = "Player " + board[column][row] + " wins";
                            }
                            isBlackTurn = !isBlackTurn;
                        }
                    }
                }
            }
        }
    }

    function checkWin(x, y, color) {
        var directions = [
            [1, 0], // Right
            [-1, 0], // Left
            [0, 1], // Down
            [0, -1], // Up
            [1, 1], // Diagonal down-right
            [-1, 1], // Diagonal down-left
            [1, -1], // Diagonal up-right
            [-1, -1] // Diagonal up-left
        ];

        for (var i = 0; i < directions.length; i++) {
            var dx = directions[i][0];
            var dy = directions[i][1];

            var count = 0;

            for (var j = 0; j < 5; j++) {
                var newX = x + dx * j;
                var newY = y + dy * j;

                if (newX >= 0 && newX < 15 && newY >= 0 && newY < 15 && board[newX][newY] === color) {
                    count++;
                } else {
                    break;
                }
            }

            if (count >= 5) {
                return true;
            }
        }

        return false;
    }


    Rectangle {
        id: endGameScreen
        visible: false
        anchors.fill: parent
        color: "blue"

        Text {
            id: winText
            text: "Player X wins!"
            anchors.centerIn: parent
            font.pixelSize: 32
        }

        Button {
            text: "Quit"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                 Qt.quit();

            }
        }
    }

}
