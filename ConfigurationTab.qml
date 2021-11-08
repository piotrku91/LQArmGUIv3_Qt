import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: configuration
    anchors.fill: parent

    GroupBox {
        id: ustawienia
        x: 37
        y: 26
        width: 250
        height: 294
        anchors.right: groupBox.left
        anchors.rightMargin: 6
        title: qsTr("Ustawienia ogólne")

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

        Switch {
            id: switch1
            x: 8
            y: 64
            text: qsTr("Włącz podajnik cytryny")
            anchors.left: sim.left
            anchors.top: sim.bottom
            anchors.topMargin: -3
        }
    }


    Row {
        anchors.bottom: configuration.bottom
        anchors.left: configuration.left

        ////////////////////////////////////////// BUTTON

    }

GroupBox {
    id: groupBox
    x: 293
    y: 26
    width: 406
    height: 294
    anchors.top: ustawienia.top
    anchors.bottom: ustawienia.bottom
    title: qsTr("Wykonaj")

    Button {
        id: button
        x: 0
        y: 13
        width: 182
        height: 106
        text: "SYNCHRONIZACJA \n CZASU"
        anchors.left: parent.left
        anchors.leftMargin: 5
    }
}

GroupBox {
    id: groupBox1
    x: 37
    y: 332
    width: 662
    height: 315
    anchors.left: ustawienia.left
    anchors.right: groupBox.right
    anchors.rightMargin: 6
    anchors.leftMargin: -6
    title: qsTr("Ręczne sterowanie ramieniem (Inkrementalnie)")

    Button {
        id: button1
        x: 38
        y: 65
        width: 86
        height: 90
        text: qsTr("+")
        anchors.horizontalCenterOffset: -268
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button2
        x: 43
        y: 178
        width: 86
        height: 90
        text: qsTr("-")
        anchors.horizontalCenterOffset: -268
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text1
        x: 39
        y: 30
        text: qsTr("1")
        font.pixelSize: 20
        font.bold: true
    }

    Button {
        id: button3
        x: 47
        y: 65
        width: 86
        height: 90
        text: qsTr("+")
        anchors.verticalCenter: button1.verticalCenter
        anchors.top: button1.top
        anchors.bottom: button1.bottom
        anchors.horizontalCenterOffset: -145
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button4
        x: 52
        y: 178
        width: 86
        height: 90
        text: qsTr("-")
        anchors.verticalCenter: button2.verticalCenter
        anchors.top: button2.top
        anchors.bottom: button2.bottom
        anchors.horizontalCenterOffset: -145
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text2
        x: 171
        y: 30
        text: qsTr("2")
        anchors.verticalCenter: text1.verticalCenter
        anchors.top: text1.top
        anchors.bottom: text1.bottom
        font.pixelSize: 20
        font.bold: true
    }

    Button {
        id: button5
        x: 37
        y: 65
        width: 86
        height: 90
        text: qsTr("+")
        anchors.verticalCenter: button1.verticalCenter
        anchors.top: button1.top
        anchors.bottom: button1.bottom
        anchors.horizontalCenterOffset: -21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button6
        x: 42
        y: 178
        width: 86
        height: 90
        text: qsTr("-")
        anchors.verticalCenter: button2.verticalCenter
        anchors.top: button2.top
        anchors.bottom: button2.bottom
        anchors.horizontalCenterOffset: -21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text3
        x: 285
        y: 30
        text: qsTr("3")
        anchors.verticalCenter: text1.verticalCenter
        anchors.top: text1.top
        anchors.bottom: text1.bottom
        font.pixelSize: 20
        font.bold: true
    }

    Button {
        id: button7
        x: 40
        y: 63
        width: 86
        height: 90
        text: qsTr("+")
        anchors.horizontalCenterOffset: 100
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button8
        x: 45
        y: 176
        width: 86
        height: 90
        text: qsTr("-")
        anchors.horizontalCenterOffset: 100
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text4
        x: 409
        y: 28
        text: qsTr("4")
        font.pixelSize: 20
        font.bold: true
    }

    Button {
        id: button9
        x: 37
        y: 63
        width: 86
        height: 90
        text: qsTr("+")
        anchors.verticalCenter: button7.verticalCenter
        anchors.top: button7.top
        anchors.bottom: button7.bottom
        anchors.horizontalCenterOffset: 223
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button10
        x: 42
        y: 176
        width: 86
        height: 90
        text: qsTr("-")
        anchors.verticalCenter: button8.verticalCenter
        anchors.top: button8.top
        anchors.bottom: button8.bottom
        anchors.horizontalCenterOffset: 223
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text5
        x: 529
        y: 28
        text: qsTr("5")
        anchors.verticalCenter: text4.verticalCenter
        anchors.top: text4.top
        anchors.bottom: text4.bottom
        font.pixelSize: 20
        font.bold: true
    }
}

GroupBox {
    id: groupBox2
    x: 716
    y: 26
    width: 292
    height: 294
    anchors.top: ustawienia.top
    anchors.bottom: ustawienia.bottom
    title: qsTr("Ustawienia trybu imprezy")

    Slider {
        id: slider
        x: 9
        y: 46
        value: 0.5
    }

    Text {
        id: text6
        x: 9
        y: 25
        text: qsTr("Czas pomiędzy rozlaniami")
        anchors.left: slider.left
        anchors.bottom: slider.top
        font.pixelSize: 12
        anchors.bottomMargin: 6
    }
}

Switch {
    id: switch2
    x: 804
    y: 258
    text: qsTr("Czekaj na wszystkich")
    anchors.horizontalCenterOffset: -27
    anchors.horizontalCenter: groupBox2.horizontalCenter
}
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:768;width:1024}D{i:9}
}
##^##*/
