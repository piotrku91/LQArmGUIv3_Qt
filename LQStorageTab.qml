import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: lqstorage
    width: 640; height: 480
    anchors.fill: parent
    anchors.margins: 20
    anchors.bottomMargin: 0
    anchors.leftMargin: 0

    function updatesl()
    {
        for (var i = 0; i < 8; i++) {

           slots.itemAt(i).children[5].text=slotmaster.getIDName(i);

           if (slotmaster.getReady(i)===true) {
               slots.itemAt(i).children[0].text=i+" - Gotowy";
               slots.itemAt(i).children[8].visible=false;
           } else {
               slots.itemAt(i).children[8].visible=true;
               slots.itemAt(i).children[0].text=i+" - Do zaciągnięcia";
           }
           slots.itemAt(i).children[6].text=slotmaster.getActualML(i);
           slots.itemAt(i).children[7].text=slotmaster.getMaxML(i);


        }

    }

    function updatess()
    {
        for (var i = 0; i < 8; i++) {
           slotmaster.setIDName(i,slots.itemAt(i).children[5].text);
           slotmaster.setActualML(i,slots.itemAt(i).children[6].text);
           slotmaster.setMaxML(i,slots.itemAt(i).children[7].text);


        }
         manager.slots_Save();

    }

    Connections {
        target: slotmaster


        onPushUpdate:
        {
          updatesl();
        }

        onDockPosition:
        {
            for (var i = 0; i < 8; i++) {
               slots.itemAt(i).children[8].enabled=true;

            }
        }

        onDockPositionLeft:
        {
            for (var i = 0; i < 8; i++) {
               slots.itemAt(i).children[8].enabled=false;

            }
        }

                }

    Row {
        anchors.leftMargin: 20
        Repeater {
            id: slots
            model: 8
            Rectangle {
                width: lqstorage.width/9; height: 300
                border.width: 1
                color: "white"

                TextArea // # children: 0
                {
                    id: slot_no
                    text: index
                    readOnly: true
                }

                Image { // # children: 1
                    id: slot_ico
                    x: parent.width/2-width/2
                    y: parent.height/2-height/2
                    width: 64
                    height: 64
                    source: "static/bottle.png"
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                TextArea // # children: 2
                {
                    id: slot_ml

                    y: slot_pgbar.y-20
                    text: slot_actualml.text+ " / " +slot_maxml.text+" ml"
                    width: parent.width
                    x: slot_pgbar.x-20
                    color: "black"
                    readOnly: true

                }

                ProgressBar { // # children: 3
                    id: slot_pgbar
                    value: slot_actualml.text
                    to: slot_maxml.text
                    x: parent.width/2-width/2
                    y: parent.height/4
                    width: 64
                    height: 16
                }



                TextField // # children: 4
                {
                    id: slot_name

                    y: parent.height-35
                    text: "default"
                    width: parent.width
                    color: "black"

                }

                TextField // # children: 5
                {
                    id: slot_id
                    font.capitalization: Font.AllUppercase
                    y: parent.height
                    text: slotmaster.getIDName(index);
                    width: parent.width
                    maximumLength: 4
                    color: "red"
                  //  onTextChanged: {slotmaster.setIDName(index,text); slot_no.text=index+": "+slotmaster.getIDName(index);}


                }

                TextField // # children: 6
                {
                    id: slot_actualml
                    inputMethodHints: Qt.ImhDigitsOnly
                    y: parent.height+35
                    text: slotmaster.getActualML(index);
                    width: parent.width
                    color: "black"
                    onTextChanged: {if (text==="0") {slots.itemAt(index).color="gray";} else {slots.itemAt(index).color="white";};
}


                }
                TextField // # children: 7
                {
                    id: slot_maxml
                    inputMethodHints: Qt.ImhDigitsOnly
                    y: slot_actualml.y+35
                    text: slotmaster.getMaxML(index);
                    width: parent.width
                    color: "black"
                   // onTextChanged: {slotmaster.setMaxML(index,text);}
                }

                Button { // # children: 8
                    id: btn_zaciag
                    y: slot_maxml.y+40
                    text: qsTr("ZACIĄGNIJ")
                    height: 50
                    enabled: false;
                    width: 100
                  //  anchors.bottom: parent.bottom
                  //  anchors.left: parent.left
                    anchors.bottomMargin: 1

                    onClicked: { manager.fuel_Force(index); }
                }

                Button { // # children: 9
                    id: btn_unpomp
                    y: btn_zaciag.y+40
                    text: qsTr("SPUŚĆ")
                    height: 50
                    enabled: false;
                    width: 100
                  //  anchors.bottom: parent.bottom
                  //  anchors.left: parent.left
                    anchors.bottomMargin: 1

                    onClicked: {  }
                }


            }


        }
    }






    Row {
        anchors.bottom: lqstorage.bottom
        anchors.left: lqstorage.left

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_savelqslots
            text: qsTr("WYŚLIJ \n DO \n URZĄDZENIA")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: { updatess(); manager.sett_ForceSave();

            }
        }

        }

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_loadlqslots
            text: qsTr("WCZYTAJ \n Z \n URZĄDZENIA")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {  manager.slots_Load();  }
        }

        }

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_backlqslots
            text: qsTr("PRZYWRÓC \n OSTATNIO \n ODCZYTANE")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {  updatesl();   }
        }

        }


        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_settsforce
            text: qsTr("")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {  }
        }

        }














    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
