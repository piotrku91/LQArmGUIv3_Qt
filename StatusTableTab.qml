
import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import io.qt.examples.backend 1.0


Item {
    id: table
    anchors.fill: parent
    property int boxWidth:125
    property int boxHeight:150
default property alias boxA: table.children

    // Position arrays
    property variant sX: [((positionrow.width/2-positionrow.width/3)-boxWidth/2), // X0
                          ((positionrow.width/2-positionrow.width/6)-boxWidth/2), // X1
                          (positionrow.width/2-boxWidth/2),                       // X2
                          ((positionrow.width/2+positionrow.width/6)-boxWidth/2), // X3
                          ((positionrow.width/2+positionrow.width/3)-boxWidth/2)] // X4

    property variant sY: [((positionrow.height/2-positionrow.height/3)-boxHeight/2),  // Y0
                          ((positionrow.height/2-positionrow.height/6)-boxHeight/2), // Y1
                          (positionrow.height/2-boxHeight/2),                        // Y2
                          ((positionrow.height/2-positionrow.height/6)-boxHeight/2), // Y3
                          ((positionrow.height/2-positionrow.height/3)-boxHeight/2)] // Y4

ListModel { id: drinkMixList }

//////////////////////////////////////////////////////////////////// FUNCTIONS /////////////////////////////////////////////////////////////////////

    function setImage(id,status)
    {
        var tmpname;

     //  tmpname = (status===true ? "full.png" : "empty.png")
   //boxA[id].children[0].source="static/shot-glass_"+tmpname


    }

    function fillLists()
    {
      slotsr.itemAt(0).children[1].model=mixer.getDrinkList();
        slotsr.itemAt(1).children[1].model=mixer.getDrinkList();
        slotsr.itemAt(2).children[1].model=mixer.getDrinkList();
        slotsr.itemAt(3).children[1].model=mixer.getDrinkList();
        slotsr.itemAt(4).children[1].model=mixer.getDrinkList();

        }

    Connections {
        target: gtable


        onPushSchemesUpdate:
        {
       fillLists();
        }
    }





    Row {
        id: positionrow
         anchors.fill: parent
        Repeater {
            id: slotsr
            model: 5

    Rectangle {
        id: box0
        x: sX[index]
        y: sY[index]
        width: boxWidth
        height: boxHeight
        color: "#17b1aa"
        radius: 20


        Image {
            id: box0_ico
            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: 64
            height: 64
            source: "static/shot-glass_empty.png"
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }


        ComboBox {
            id: box0_list
            y: (parent.height)
            width: boxWidth
            model:;// mixer.getDrinkList()
        }

        Button {
            id: box0_buttonun
            text: qsTr("ODBLOKUJ")
            height: 20
            y: parent.height+box0_list.height+10

        }

        Button {
            id: box0_buttonexe
            text: qsTr("NALEJ")
            height: 20
            y: parent.height+box0_list.height+10+20+10

        }



    }


        }
    }






    ///////////////

    Button {
        id: guzik
        text: "patrz"

        width: 45
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 1
        anchors.verticalCenterOffset: 96
        anchors.horizontalCenterOffset: -30


        onClicked: {
            setImage(0,true)

           fillLists()

        }


    }

    Text {
        id: element
        x: parent.width/2-width/2
        y: parent.height/4
        width: 52
        height: 37
        text: qsTr("LQArm ")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#650000"
        style: Text.Outline
        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 36
    }





}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
