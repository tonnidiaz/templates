import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import "../views"

Item{
    height: parent.height
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
                        label: "Home"
                        _icon: "../assets/icons/home.svg"
                    }
                    ListElement {
                        i: 1
                        label: "About"
                        _icon: "../assets/icons/info.svg"
                    }

                }

            delegate: Button {
                implicitWidth: bar.width
                icon.source: _icon

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

    HomeView{}

    AboutView{}
    }

}

