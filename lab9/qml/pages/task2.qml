import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "task"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
    }
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "olive"//"darkslateblue";
            ctx.fillRect(0, 0, width, height);
        }
    }
    AnimatedSprite {
        anchors.centerIn: parent
        source: "sprite.png"
        width: 480
        height: 441
        frameCount: 24
        frameWidth: 480 / 6
        frameHeight: 441 / 4
        frameDuration: 70
        interpolate: false
        loops: AnimatedSprite.Infinite

    }

}
