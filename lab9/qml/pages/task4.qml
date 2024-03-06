import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "blue";
            ctx.fillRect(0, 0, width, height/12);
            ctx.fillStyle = "white";
            ctx.fillRect(0, height/12, width, height/4);
            ctx.fillStyle = "blue";
            ctx.fillRect(0, height/4+height/12, width, height/12);
            ctx.fillStyle = "yellow";
            ctx.beginPath()
            ctx.moveTo(width/2, 3*height/4);
            ctx.lineTo(0, height);
            ctx.lineTo(width, height);
            ctx.fill();
        }
    }
        ParticleSystem {
            id: particleSystem
            Emitter {
                id: emitter
                system: particleSystem
                width: 100
                height: 100
                emitRate: 100
                maximumEmitted: 200
                lifeSpan: 3000
                enabled: true
                x: 300
                y: 200
                velocity: AngleDirection{magnitude: 64; angleVariation: 360}
                        shape: EllipseShape { fill: false }
            }
        }
    ItemParticle {
        system: particleSystem
        delegate: Rectangle {
            width: 10
            height: 10
            color: "yellow"
            radius: 5
            border.width: 0
        }
    }
    Gravity {
        system: particleSystem
        anchors.fill: parent
        angle: 90
        magnitude: 300
    }
}
