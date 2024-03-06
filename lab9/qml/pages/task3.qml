import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {
    id: page
    Canvas {
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "moccasin";
            ctx.fillRect(0, 0, width, height);
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
                maximumEmitted: 100
                lifeSpan: 1000
                enabled: false
                velocity: AngleDirection{magnitude: 64; angleVariation: 360}
                        shape: EllipseShape { fill: false }
            }
        }
    ItemParticle {
        system: particleSystem
        delegate: Rectangle {
            width: 10
            height: 10
            color: "red"
            radius: 5
            border.width: 0
        }
    }
    MouseArea {
        anchors.fill: page
        onClicked: {
            emitter.x = mouseX
            emitter.y = mouseY
            emitter.burst(100)
        }
    }
}
