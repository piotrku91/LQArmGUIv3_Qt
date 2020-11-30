
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

         slotsr.itemAt(0).children[1].currentIndex=gtable.getSchemeIDX(0);
        slotsr.itemAt(1).children[1].currentIndex=gtable.getSchemeIDX(1);
        slotsr.itemAt(2).children[1].currentIndex=gtable.getSchemeIDX(2);
        slotsr.itemAt(3).children[1].currentIndex=gtable.getSchemeIDX(3);
        slotsr.itemAt(4).children[1].currentIndex=gtable.getSchemeIDX(4);

        }


    function fillImages()
    {

        for (var i = 0; i < 5; i++) {

         if  (gtable.getLockFlag(i))
                 {
            slotsr.itemAt(i).children[0].source="static/shot-glass_full.png"
                 }
                     else {
                      slotsr.itemAt(i).children[0].source="static/shot-glass_empty.png" ;
         }

        }

        }

    function fillStates()
    {

        for (var i = 0; i < 5; i++) {

         if  (gtable.getActiveState(i))
                 {
            slotsr.itemAt(i).color="lime";
                 }
                     else {
                      slotsr.itemAt(i).color="#17b1aa";
         }

        }

        }

    Connections {
        target: gtable


        onPushSchemesUpdate:
        {
       fillLists();
        }

        onPushImagesUpdate:
        {
       fillImages();
        }

        onPushStatesUpdate:
        {
       fillStates();
        }

    }





    Row {
        id: positionrow
        anchors.fill: parent
        anchors.left: parent.left
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
            onCurrentIndexChanged: {gtable.setSchemeByIDX(index,currentIndex); manager.schemeChange_Save(index);}

        }

        MouseArea {
            anchors.fill: parent

            onClicked: {gtable.setActiveState(index)}
        }





        }
    }






    ///////////////


Row {
    anchors.bottom: parent.bottom
    anchors.left: parent.left

    ////////////////////////////////////////// BUTTON

    Rectangle {
        color:"black"
        height: 100
        width: 105
    Button {
        id: btn_ulck
        text: qsTr("ODBLOKUJ")
        height: 100
        width: 100
      //  anchors.bottom: parent.bottom
      //  anchors.left: parent.left
        anchors.bottomMargin: 1

        onClicked: { gtable.setLockForActive(false)}
    }

    }

    ////////////////////////////////////////// BUTTON

    Rectangle {
        color:"black"
        height: 100
        width: 105
    Button {
        id: btn_lck
        text: qsTr("ZABLOKUJ")
        height: 100
        width: 100


    //    anchors.bottom: parent.bottom
     //   anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 1

        onClicked: { gtable.setLockForActive(true);



        }
    }

}

    ////////////////////////////////////////// BUTTON

    Rectangle {
        color:"black"
        height: 100
        width: 105
    Button {
        id: btn_selall
        text: qsTr("ZAZNACZ \n WSZYSTKIE")
        height: 100
        width: 100


    //    anchors.bottom: parent.bottom
     //   anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 1

        onClicked: { gtable.setActiveStateALL(true)



        }
    }

}

    ////////////////////////////////////////// BUTTON

    Rectangle {
        color:layout_color_backgrounds
        height: 100
        width: 150
    Button {
        id: btn_unselall
        text: qsTr("ODZNACZ \n WSZYSTKIE")
        height: 100
        width: 100


    //    anchors.bottom: parent.bottom
     //   anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 1

        onClicked: { gtable.setActiveStateALL(false)



        }
    }

}

    ////////////////////////////////////////// BUTTON

    Rectangle {
        color:"black"
        height: 100
        width: 150
    Button {
        id: btn_execute
        text: qsTr("NALEWANIE")
        font.bold: true
        height: 100
        width: 150


    //    anchors.bottom: parent.bottom
     //   anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 1

        onClicked: { gtable.setActiveStateALL(false)



        }
    }

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
}
