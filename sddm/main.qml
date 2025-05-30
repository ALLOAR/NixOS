import QtQuick 2.0
import Sddm 1.0

Rectangle {
    width: 1920
    height: 1080
    color: "#1e1e2e"  // фон

    // Поле ввода логина
    TextField {
        id: username
        placeholderText: "Username"
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 300
    }

    // Поле ввода пароля
    PasswordField {
        id: password
        placeholderText: "Password"
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: username.bottom
        anchors.topMargin: 20
    }

    // Кнопка логина
    Rectangle {
        width: 300; height: 40
        color: "#3d495b"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: password.bottom
        anchors.topMargin: 20
        MouseArea {
            anchors.fill: parent
            onClicked: sddm.login(username.text, password.text)
        }
        Text {
            anchors.centerIn: parent
            text: "Login"
            color: "white"
        }
    }
}
