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
        lemonswitch.checked=Lemon;
        statustxt.text=mixer.getStatusTxt();
            //textchan.text=mixer.getactualName();



        }

        onPushDrinkListUpdate:
        {

            kombo.model=mixer.getDrinkList()
            kombo.currentIndex=idxrtn;
         //   textchan.text=mixer.getActualName();


        }


                }

    Rectangle {
        id: framemixer
        x: 0
        y: 0
        width: mixert.width;
        height: mixert.height;
        color:layout_color_backgrounds
      //  border.width: 1



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


            onCurrentIndexChanged: {mixer.itemIndexChanged(currentIndex); }
        }

        TextField {
            id: textchan
            width: 559
            text: kombo.currentText
            x:20
            y: kombo.y+50
          //  anchors.verticalCenterOffset: 96
            //anchors.horizontalCenterOffset: -30

        }

        Rectangle {
            id: preview_back
            x: 50
            y: mixert.height/3;
            width: 200
            height: 110*3
            color: "silver"
            radius: 5
        }

        Rectangle {
            id: preview_i1
            x: 50
            y: preview_back.y+(preview_back.height-height)
            width: 200
            height: 1
            color: "red"
            radius: 5

            Text {
              id: i1cap
              x: (preview_i1.x+(preview_i1.width/4));
              y: (preview_i1.y+(preview_i1.heigth/2));
              width: 25
              height: 25
              text: qsTr("1")

              styleColor: "red"
              color:"white"
              font.bold: true
              font.family: "Verdana"
              font.pixelSize: 12
          }

        }



        Rectangle {
            id: preview_i2
            x: 50
            y: preview_i1.y - height
            width: 200
            height: 1
            color: "blue"
            radius: 5

            Text {
              id: i2cap
              x: (preview_i2.x+(preview_i2.width/4));
              y: (preview_i2.y+(preview_i2.heigth/2));
              width: 25
              height: 25
              text: qsTr("1")

              styleColor: "red"
              color:"white"
              font.bold: true
              font.family: "Verdana"
              font.pixelSize: 12
          }
        }

        Rectangle {
            id: preview_i3
            x: 50
            y: preview_i2.y - height
            width: 200
            height: 1
            color: "green"
            radius: 5
            Text {
              id: i3cap
              x: (preview_i3.x+(preview_i3.width/4));
              y: (preview_i3.y+(preview_i3.heigth/2));
              width: 25
              height: 25
              text: qsTr("1")

              styleColor: "red"
              color:"white"
              font.bold: true
              font.family: "Verdana"
              font.pixelSize: 12
          }
        }

        Rectangle {
            id: preview_i4
            x: 50
            y: preview_i3.y - height
            width: 200
            height: 1
            color: "black"
            radius: 5

            Text {
              id: i4cap
              x: (preview_i4.x+(preview_i4.width/4));
              y: (preview_i4.y+(preview_i4.heigth/2));
              width: 25
              height: 25
              text: qsTr("1")

              styleColor: "red"
              color:"white"
              font.bold: true
              font.family: "Verdana"
              font.pixelSize: 12
          }
        }

        Text {
          id: sumcap
          x: preview_back.x+(preview_back.width/2);
          y: preview_back.y
          width: 25
          height: 25
          text: qsTr("Razem ml: 0")

          styleColor: "black"
          color:"black"
          font.bold: true
          font.family: "Verdana"
          font.pixelSize: 12
      }



 Column {
      id:col;


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

     Switch {
         id: lemonswitch
         x: label1.x;
         y: label1.y+60;
         text: qsTr("Cytryna")
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


                onCurrentTextChanged: {
                    i1cap.text=comboslots.itemAt(0).children[0].currentText+" ("+comboslots.itemAt(0).children[1].text+" ml)";
                    i2cap.text=comboslots.itemAt(1).children[0].currentText+" ("+comboslots.itemAt(1).children[1].text+" ml)";
                    i3cap.text=comboslots.itemAt(2).children[0].currentText+" ("+comboslots.itemAt(2).children[1].text+" ml)";
                    i4cap.text=comboslots.itemAt(3).children[0].currentText+" ("+comboslots.itemAt(3).children[1].text+" ml)";

                }
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
                onTextChanged: {
                    var sum=0;
                    for (var i=0; i<4; i++) {
                    sum=sum+parseInt(comboslots.itemAt(i).children[1].text);
                    }
//label2.text=sum;
                    comboslots.itemAt(0).children[0].onCurrentTextChanged();
                   // label1.text=preview_i1.height=parseInt(comboslots.itemAt(index).children[1].text)/sum*100;
                    if (sum===0) {
                         preview_i1.height=0;
                         preview_i2.height=0;
                        preview_i3.height=0;
                        preview_i4.height=0;
                        i1cap.visible=false;
                        i2cap.visible=false;
                        i3cap.visible=false;
                        i4cap.visible=false;
                        sumcap.text="Razem "+sum+" ml";

                    } else
                    {
    sumcap.text="Razem "+sum+" ml";
                    preview_i1.height=(parseInt(comboslots.itemAt(0).children[1].text)/sum*100)*3
                    preview_i2.height=(parseInt(comboslots.itemAt(1).children[1].text)/sum*100)*3
                    preview_i3.height=(parseInt(comboslots.itemAt(2).children[1].text)/sum*100)*3
                    preview_i4.height=(parseInt(comboslots.itemAt(3).children[1].text)/sum*100)*3

                        if (preview_i1.height>0) i1cap.visible=true; else i1cap.visible=false;
                        if (preview_i2.height>0) i2cap.visible=true; else i2cap.visible=false;
                        if (preview_i3.height>0) i3cap.visible=true; else i3cap.visible=false;
                        if (preview_i4.height>0) i4cap.visible=true; else i4cap.visible=false;

}
                }

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


                                              mixer.saveChanges(textchan.text,
                                             comboslots.itemAt(0).children[0].currentIndex,comboslots.itemAt(0).children[1].text,
                                             comboslots.itemAt(1).children[0].currentIndex,comboslots.itemAt(1).children[1].text,
                                             comboslots.itemAt(2).children[0].currentIndex,comboslots.itemAt(2).children[1].text,
                                             comboslots.itemAt(3).children[0].currentIndex,comboslots.itemAt(3).children[1].text, lemonswitch.checked)
                                             mixer.setActualName(textchan.text,kombo.currentIndex);
                           savingstate=false;

                                                manager.drink_Save();

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

            onClicked: { manager.drink_Load();
            }
        }

        }

        ////////////////////////////////////////// BUTTON

        Rectangle {
            color:"black"
            height: 100
            width: 105
        Button {
            id: btn_delete
            text: qsTr("USUŃ \n DRINK")
            height: 100
            width: 100
          //  anchors.bottom: parent.bottom
          //  anchors.left: parent.left
            anchors.bottomMargin: 1

            onClicked: {
                if (kombo.currentText!="default") {
                manager.drink_Delete(kombo.currentText);
                mixer.deleteItem(kombo.currentIndex);
};
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









