import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtWebView 1.1

Window {

    visible: true
    width: 640
    height: 480
    title: qsTr("Web Browser")

    ColumnLayout {

        anchors.fill: parent

        RowLayout {

            ToolButton {

                text: "<"
                enabled: browser.canGoBack
                onClicked: browser.goBack()

            }

            ToolButton {

                text: ">"
                enabled: browser.canGoForward
                onClicked: browser.goForward()

            }

            TextField {

                id: urlText
                focus: true
                Layout.fillWidth: true
                Keys.onReturnPressed: browser.url = text
                text: browser.url

                BusyIndicator {

                    anchors { right: parent.right; verticalCenter: parent.verticalCenter }
                    running: browser.loading
                    z: 2

                }

            }

        }

        WebView {

            id: browser
            Layout.fillHeight: true
            url: "https://google.com"
            Layout.preferredWidth: parent.width

        }

    }

}
