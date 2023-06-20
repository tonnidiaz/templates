import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Material.theme: Material.Dark
    Material.accent: Material.Orange
    Material.foreground: "white"

        TabBar{
            id: bar
            width: 60
            height: parent.height
            currentIndex: 0
            background:
                Rectangle{

                    color: "#2B2B2B"}
            contentItem: ListView {
                width: parent.width
                currentIndex: bar.currentIndex
                id: barList
                model:
                    ListModel {
                    id: mdl
                    ListElement {
                            i: 0
                            label: "A"
                        }
                        ListElement {
                            i: 1
                            label: "V"
                        }

                    }

                delegate: Button {
                    implicitWidth: bar.width
                        text: label
                        background: Rectangle{
                            anchors.fill: parent
                            color: mouse.containsMouse ? "#353637" : "#2B2B2B"

                            MouseArea {
                                cursorShape: Qt.PointingHandCursor
                                anchors.fill: parent
                                    id: mouse
                                    hoverEnabled: true
                            }
                        }

                        onClicked: {
                            bar.currentIndex = i
                        }
                    }
                }

        }

  StackLayout{
        x: 60
        currentIndex: bar.currentIndex

        Text{
            text: "Tab1"
            color: "white"
            Layout.alignment: Qt.AlignCenter
            font.bold: true
        }

        Text{
            text: "Tab2"
            color: "white"
            Layout.alignment: Qt.AlignCenter
            font.bold: true
        }
    }
}
