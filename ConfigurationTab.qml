import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: configuration
    anchors.fill: parent

    GroupBox {
        id: groupBox
        x: 37
        y: 26
        width: 567
        height: 200
        title: qsTr("Group Box")

        Switch {
            id: sim
            x: 8
            y: 18
            checked: true;
            text: qsTr("Symulacja nalewania")
            onCheckedChanged: {
                if (checked) { manager.sendToDevice("<rl_simon;>",4);} else {manager.sendToDevice("<rl_simoff;>",4);};

            }
        }
    }

    GroupBox {
        id: groupBox1
        x: 37
        y: 250
        width: 567
        height: 200
        title: qsTr("Group Box")

        Switch {
            id: element1
            x: 0
            y: 17
            text: qsTr("HTTP API")
        }
    }


    Row {
        anchors.bottom: configuration.bottom
        anchors.left: configuration.left

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_savelqslots
            text: qsTr("WYMUŚ \N ZAPIS")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {
            }
        }







}

}
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;annotation:"1 //;;// Konfiguracja urządzenia //;;//  //;;//  //;;// 1620828873";customId:""}
}
##^##*/
