import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.12
import myfpt.Backend 1.0

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello Cuong")
    property bool isSignedIn: false


    //    myfpt.Backend {
    //        id: myfpt
    //    }

    Screen_btn {
        id: myscreen
        visible: false
    }

    ScreenBuilding{
        id: myBackend
        onLoginSuccess:{
            console.log("onLoginSuccess")
            root.isSignedIn = true
            myBackend.status = ""
            myscreen.visible = true
            root.visible = false

        }
        onLoginFail:{
            console.log("onLoginFail")
            root.isSignedIn = false
            //            myBackend.status = ""
            root.visible = false
        }
    }

    Column{
        visible: !isSignedIn
        anchors.centerIn: parent
        spacing: 10
        TextField{
            id: userNameInput
            placeholderText: "user name"
            width: parent.width
        }
        TextField{
            id: passwordInput
            placeholderText: "password"
            echoMode: TextInput.Password
            width: parent.width
        }
        Button{
            id: signInBUtton
            text: "Sign in"
            width: 200
            height: 80
            onClicked: {
                //                root.isSignedIn = true
                myBackend.login(userNameInput.text, passwordInput.text)
                console.log("button is clicked")
            }
        }
        Label{
            id: statusLabel
            text: myBackend.status
        }

    }
}
