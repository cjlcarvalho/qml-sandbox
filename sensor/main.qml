import QtQuick 2.10
import QtQuick.Window 2.10
import QtSensors 5.9

Window {

    id: window
    title: qsTr("Sensor")
    width: 640
    height: 480
    visible: true

    property var pixelDensity // Criação de propriedades adicionais

    Rectangle {

        id: bola
        height: 24 * pixelDensity
        width: 24 * pixelDensity
        x: window.width - width
        y: window.height - height
        radius: width / 2
        color: "blue"

        Behavior on x { NumberAnimation { duration: 100 } }
        Behavior on y { NumberAnimation { duration: 100 } }

    }

    ProximitySensor {
        active: true
        dataRate: 20
        onReadingChanged: bola.color = (reading.near) ? "black" : "green"
    }

    Accelerometer {
        active: true
        dataRate: 20

        onReadingChanged: {
            var newX = bola.x - reading.x * pixelDensity * 30
            var newY = bola.y + reading.y * pixelDensity * 30

            if (newX + bola.width > window.width)
                newX = window.width - bola.width
            if (newY + bola.height > window.height)
                newY = window.height - bola.height

            if (newX < 0)
                newX = 0
            if (newY < 0)
                newY = 0

            bola.x = newX
            bola.y = newY
        }

    }

    Component.onCompleted: pixelDensity = Screen.logicalPixelDensity // Funciona como um construtor, após o Window ser criado e antes de aparecer na tela

}
