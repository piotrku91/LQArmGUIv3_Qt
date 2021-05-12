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
            id: element
            x: 8
            y: 18
            text: qsTr("Symulacja nalewania")
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






}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;annotation:"1 //;;// Konfiguracja urządzenia //;;//  //;;//  //;;// 1620828873";customId:""}
}
##^##*/
