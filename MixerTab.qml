import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: mixert
    anchors.fill: parent
    anchors.margins: 20
    width: 640; height: 480

    Connections {
        target: mixer


        onPushUpdate:
        {
        //  kombo.model=mixer.getIDList();
            comboslots.itemAt(0).children[0].model=mixer.getIDList();
            comboslots.itemAt(1).children[0].model=mixer.getIDList();
            comboslots.itemAt(2).children[0].model=mixer.getIDList();
            comboslots.itemAt(3).children[0].model=mixer.getIDList();
        }
                }

    Rectangle {
        id: framemixer
        width: mixert.width;
        height: mixert.height;
        border.width: 1
        color: "white"

    ComboBox {
        id: kombo
        x: 20
        width: 559
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 20
        model: mixer.getDrinkList()


      //  onCurrentIndexChanged: {mixer.itemIndex=currentIndex}
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






}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
