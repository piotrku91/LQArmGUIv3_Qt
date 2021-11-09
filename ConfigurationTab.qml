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
        width: 239
        height: 294
        anchors.right: groupBox.left
        anchors.rightMargin: 17
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
            text: qsTr("Podajnik cytryny")
            anchors.left: sim.left
            anchors.top: sim.bottom
            checked: true
            anchors.topMargin: -3
        }

        Text {
            id: timetext
            x: 899
            y: 46
            width: 24
            height: 34
            color: "#f30505"
            text: slidertime.value
            font.pixelSize: 12
            rotation: 8.599

        }

        Text {
            id: text7
            x: 108
            y: 68
            text: qsTr("min")
            anchors.verticalCenter: switch1.verticalCenter
            font.pixelSize: 12
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 814
            anchors.horizontalCenter: switch1.horizontalCenter
        }

        Switch {
            id: switch3
            x: 8
            y: 101
            width: 221
            height: 40
            text: qsTr("Przyciski potwierdzeń")
            anchors.left: sim.left
            anchors.right: switch1.right
            anchors.top: switch1.bottom
            checked: true
            anchors.rightMargin: -40
            anchors.topMargin: 0
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
        height: 85
        text: "SYNCHRONIZACJA \n CZASU"
        anchors.left: parent.left
        anchors.leftMargin: 5
        onClicked: {manager.sendToDevice("<proc_sync;>",4);}
    }
}

GroupBox {
    id: groupBox1
    x: 37
    y: 332
    width: 662
    height: 339
    anchors.left: ustawienia.left
    anchors.right: groupBox.right
    anchors.rightMargin: -19
    anchors.leftMargin: -6
    title: qsTr("Ręczne sterowanie ramieniem (Inkrementalnie)")

    Button {
        id: button1
        x: 38
        y: 65
        width: 86
        height: 90
        text: qsTr("+")
        flat: false
        highlighted: false
        anchors.horizontalCenterOffset: -268
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {manager.sendToDevice("<srv_hi;1;"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;1;-"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;2;"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;2;-"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;3;"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;3;-"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;4;"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;4;-"+moveamount.value+";>",4);}
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
        onClicked: {manager.sendToDevice("<srv_hi;5;"+moveamount.value+";>",4);}

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
        onClicked: {manager.sendToDevice("<srv_hi;5;-"+moveamount.value+";>",4);}
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

    Text {
        id: servo1pos
        x: 35
        y: 291
        width: 0
        height: 24
        color: "#d81010"
        text: "0"
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.bottomMargin: 0
        font.bold: true
    }

    Text {
        id: servo2pos
        x: 159
        y: 291
        color: "#d81010"
        text: "0"
        anchors.verticalCenter: servo1pos.verticalCenter
        anchors.top: servo1pos.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        font.bold: true
    }

    Text {
        id: servo3pos
        x: 285
        y: 291
        width: 24
        height: 24
        color: "#d81010"
        text: "0"
        anchors.verticalCenter: servo1pos.verticalCenter
        anchors.left: text3.left
        anchors.right: servo2pos.right
        anchors.top: servo1pos.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.rightMargin: -136
        anchors.bottomMargin: 0
        font.bold: true
    }

    Text {
        id: servo4pos
        x: 399
        y: 291
        width: 24
        height: 24
        color: "#d81010"
        text: "0"
        anchors.verticalCenter: servo1pos.verticalCenter
        anchors.left: text3.left
        anchors.right: text4.right
        anchors.top: servo1pos.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.verticalCenterOffset: 0
        anchors.leftMargin: 111
        anchors.bottomMargin: 0
        font.bold: true
        anchors.rightMargin: -8
    }

    Text {
        id: servo5pos
        x: 519
        y: 291
        width: 24
        height: 24
        color: "#d81010"
        text: "0"
        anchors.verticalCenter: servo1pos.verticalCenter
        anchors.left: text3.left
        anchors.right: text5.right
        anchors.top: servo1pos.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.leftMargin: 231
        anchors.verticalCenterOffset: 0
        anchors.bottomMargin: 0
        font.bold: true
        anchors.rightMargin: -120
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
        id: slidertime
        x: 9
        y: 46
        stepSize: 1
        to: 30
        from: 4
        value: 4
        onValueChanged: {manager.sendToDevice("<proc_sclk;"+value+";>",4);}
    }

    Text {
        id: text6
        x: 9
        y: 25
        text: qsTr("Czas pomiędzy rozlaniami")
        anchors.left: slidertime.left
        anchors.bottom: slidertime.top
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

Slider {
    id: moveamount
    x: 579
    y: 483
    stepSize: 1
    to: 1000
    from: 0
    rotation: 90
    value: 200
    onValueChanged: {valueformove.text=moveamount.value;}
}

Text {
    id: valueformove
    x: 659
    y: 362
    width: 60
    height: 15
    text: qsTr("200")
    anchors.left: moveamount.left
    anchors.right: groupBox.right
    anchors.bottom: groupBox1.bottom
    font.pixelSize: 12
    anchors.rightMargin: -6
    anchors.bottomMargin: 270
    anchors.leftMargin: 89
}

GroupBox {
    id: groupBox3
    x: 762
    y: 332
    width: 259
    height: 339
    anchors.top: groupBox1.top
    anchors.bottom: groupBox1.bottom
    anchors.topMargin: 0
    anchors.horizontalCenterOffset: 0
    title: qsTr("Połączenie z urządzeniem")
    anchors.horizontalCenter: groupBox2.horizontalCenter

    Button {
        id: button11
        x: 0
        y: 200
        width: 100
        height: 67
        text: qsTr("POŁĄCZ")
        anchors.left: parent.left
        anchors.leftMargin: 0

        ComboBox {
            id: comboBox
            x: 0
            y: -149
            width: 225
            height: 40
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 4
            anchors.bottomMargin: 176
        }
    }

    Button {
        id: button12
        x: 122
        y: 275
        text: qsTr("ROZŁĄCZ")
        anchors.verticalCenter: button11.verticalCenter
        anchors.top: button11.top
    }

    Text {
        id: text8
        x: 0
        y: 27
        width: 42
        height: 21
        text: qsTr("PORT:")
        anchors.left: parent.left
        font.pixelSize: 12
    }
}
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:768;width:1024}D{i:6}D{i:12}D{i:27}
D{i:28}D{i:29}D{i:30}
}
##^##*/
