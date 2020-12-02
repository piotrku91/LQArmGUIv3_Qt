import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: mixert
    anchors.fill: parent
    anchors.margins: 0
    width: 640; height: 480
    property bool savingstate: false;

    Connections {
        target: mixer


        onPushIDListUpdate:
        {
        //  kombo.model=mixer.getIDList();
            comboslots.itemAt(0).children[0].model=mixer.getIDList();
            comboslots.itemAt(1).children[0].model=mixer.getIDList();
            comboslots.itemAt(2).children[0].model=mixer.getIDList();
            comboslots.itemAt(3).children[0].model=mixer.getIDList();
            //table.filllist();
            mixer.callNewViewUpdate();
        }


        onPushNewViewUpdate:
        {
        comboslots.itemAt(0).children[0].currentIndex=AV_LQ1_itemIndex;
        comboslots.itemAt(0).children[1].text=LQ1_amo;
        comboslots.itemAt(1).children[0].currentIndex=AV_LQ2_itemIndex;
        comboslots.itemAt(1).children[1].text=LQ2_amo;
        comboslots.itemAt(2).children[0].currentIndex=AV_LQ3_itemIndex;
        comboslots.itemAt(2).children[1].text=LQ3_amo;
        comboslots.itemAt(3).children[0].currentIndex=AV_LQ4_itemIndex;
        comboslots.itemAt(3).children[1].text=LQ4_amo;
        statustxt.text=mixer.getStatusTxt();

        }

        onPushDrinkListUpdate:
        {

            kombo.model=mixer.getDrinkList()

        }


                }

    Rectangle {
        id: framemixer
        x: 0
        y: 0
        width: mixert.width;
        height: mixert.height;
      //  border.width: 1
        color: layout_color_backgrounds



        Text {
          id: statustxt
          x: 300
          y: 300
          width: 52
          height: 37
          text: qsTr("STATUS ODCZYTU")

          styleColor: "red"
          font.bold: true
          font.family: "Verdana"
          font.pixelSize: 14
      }

    ComboBox {
        id: kombo
        x: 20
        width: 559
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 20
        model: mixer.getDrinkList()


        onCurrentIndexChanged: {mixer.itemIndexChanged(currentIndex);}
    }


 Column {

     Text {
       id: label1
       x: framemixer.width/2+(framemixer.width/8);
       y: framemixer.height/4
       width: 52
       height: 37
       text: qsTr("Napój")

       styleColor: "#650000"
       font.bold: true
       font.family: "Verdana"
       font.pixelSize: 14
   }

     Text {
       id: label2
       x: framemixer.width/2+(framemixer.width/8)+250;
       y: framemixer.height/4
       width: 52
       height: 37
       text: qsTr("Ilość (Ml)")

       styleColor: "#650000"
       font.bold: true
       font.family: "Verdana"
       font.pixelSize: 14
   }

        Repeater {
            id: comboslots
            model: 4
Row {




            ComboBox {
                id: komboslot
                x: framemixer.width/2+(framemixer.width/8);
                y: framemixer.height/4+(index)*60

                width: 200
                height: 40

                model: mixer.getIDList()


              //  onCurrentIndexChanged: {mixer.itemIndex=currentIndex}
            }

            TextField
            {
                id: lqamslot
                inputMethodHints: Qt.ImhDigitsOnly
                x: framemixer.width/2+(framemixer.width/8)+250;
                y: framemixer.height/4+(index)*60;
                text: "22"

                width: 100
                color: "black"

            }


}


        }
 }




    }


    Row {
        anchors.bottom: mixert.bottom
        anchors.left: mixert.left

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_savedrinks
            text: qsTr(" WYŚLIJ \n DO \n URZĄDZENIA")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {  savingstate=true;

                                              mixer.saveChanges(kombo.currentText,
                                             comboslots.itemAt(0).children[0].currentIndex,comboslots.itemAt(0).children[1].text,
                                             comboslots.itemAt(1).children[0].currentIndex,comboslots.itemAt(1).children[1].text,
                                             comboslots.itemAt(2).children[0].currentIndex,comboslots.itemAt(2).children[1].text,
                                             comboslots.itemAt(3).children[0].currentIndex,comboslots.itemAt(3).children[1].text)

                           savingstate=false;

            }
        }

        }
        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_saveandsend
            text: qsTr("WCZYTAJ \n Z \n URZĄDZENIA")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {

            }
        }

        }

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_create
            text: qsTr("STWÓRZ \n NOWY \n DRINK")
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






    ////////////////



}









