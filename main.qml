import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import "components"

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Material.theme: Material.Dark
    Material.accent: Material.Orange
    Material.foreground: "white"

    Sidenav{

    }

}
