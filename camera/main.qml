import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10
import QtMultimedia 5.9

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property var availableCameras: QtMultimedia.availableCameras
    property int currentCamera: 0

    ColumnLayout {

        spacing: 20
        anchors.fill: parent

        VideoOutput {

            Layout.fillHeight: true
            Layout.fillWidth: true

            source: Camera {
                id: camera;
                deviceId: QtMultimedia.defaultCamera.deviceId

                imageCapture {
                    onImageCaptured: {
                        photo.source = preview
                        photo.visible = true
                    }
                }
            }
            autoOrientation: true
            anchors.fill: parrent

        }

        RowLayout {

            width: parent.width
            spacing: 20

            Label {
                id: label
                text: camera.displayName
                Layout.fillWidth: true
            }

            Button {
                text: "Change Camera"
                onClicked: {
                    photo.visible = false

                    currentCamera++
                    if (currentCamera === availableCameras.length)
                        currentCamera = 0

                    camera.deviceId = availableCameras[currentCamera].deviceId
                }
            }

            Button {
                text: "Take picture"

                onClicked: {
                    camera.imageCapture.capture()
                }
            }
        }

        Image {
            id: photo
            Layout.fillWidth: true
        }
    }
}
