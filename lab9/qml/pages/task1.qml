import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "royalblue";
            ctx.fillRect(0, 0, width, height/2);
            ctx.fillStyle = "yellow"
            ctx.fillRect(0, height/2, width, height/2)
            ctx.fillStyle = "red";
            ctx.fillRect(width/4, 3*height/8, width/2, width/2)
            ctx.fillStyle = 'black'
            ctx.fillRect(3*width/4-width/8, 7*height/32, width/16, width/8)
            ctx.fillStyle = 'white'
            ctx.beginPath()
            ctx.moveTo(width/2, height/5);
            ctx.lineTo(width/8, 3*height/8);
            ctx.lineTo(7*width/8, 3*height/8);
            ctx.fill();
            ctx.closePath();
        }
    }
}
