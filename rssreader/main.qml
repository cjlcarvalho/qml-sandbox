import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: "-"
            }
        }
    }
}
