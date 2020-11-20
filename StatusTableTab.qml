
import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import io.qt.examples.backend 1.0


Item {
    id: table
    anchors.fill: parent
    property int boxWidth:100
    property int boxHeight:150
default property alias boxA: table.children


ListModel { id: drinkMixList }

//////////////////////////////////////////////////////////////////// FUNCTIONS /////////////////////////////////////////////////////////////////////

    function setImage(id,status)
    {
        var tmpname;

       tmpname = (status===true ? "full.png" : "empty.png")
   boxA[id].children[0].source="static/shot-glass_"+tmpname


    }

    function fillLists(listmodel)
    {
        // Test  version
        for (var i = 0; i < 5; i++) {
          boxA[i].children[1].model=drinkMixList
            drinkMixList.clear()

            for (var j = 0; j < 3; j++) {
                drinkMixList.append({text: "Drink"+j})
            }

        }



    }

//////////////////////////////////////////////////////////////////// BOX 0 /////////////////////////////////////////////////////////////////////
    Rectangle {
        id: box0
        x: (parent.width/2-parent.width/3)-width/2
        y: (parent.height/2-parent.height/3)-height/2
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
            model: ["First", "Second", "Third"]
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


//////////////////////////////////////////////////////////////////// BOX 1 /////////////////////////////////////////////////////////////////////

    Rectangle {
        id: box1
        x: (parent.width/2-parent.width/6)-width/2
        y: (parent.height/2-parent.height/6)-height/2
        width: boxWidth
        height: boxHeight
        color: "#17b1aa"
        radius: 20

        Image {
            id: box1_ico
            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: 64
            height: 64
            source: "static/shot-glass_empty.png"
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }

        ComboBox {
            id: box1_list
            y: (parent.height)
            width: boxWidth
            model: ["First", "Second", "Third"]
        }

    }

//////////////////////////////////////////////////////////////////// BOX 2 /////////////////////////////////////////////////////////////////////

    Rectangle {
        id: box2
        x: (parent.width/2)-width/2
        y: (parent.height/2)-50
        width: boxWidth
        height: boxHeight
        color: "#17b1aa"
        radius: 20

        Image {
            id: box2_ico
            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: 64
            height: 64
            source: "static/shot-glass_empty.png"
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }


        ComboBox {
            id: box2_list
            y: (parent.height)
            width: boxWidth
            model: ["First", "Second", "Third"]
        }




    }

//////////////////////////////////////////////////////////////////// BOX 3 /////////////////////////////////////////////////////////////////////

    Rectangle {
        id: box3
        x: (parent.width/2+parent.width/6)-width/2
        y: (parent.height/2-parent.height/6)-height/2
        width: boxWidth
        height: boxHeight
        color: "#17b1aa"
        radius: 20

        Image {
            id: box3_ico
            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: 64
            height: 64
            source: "static/shot-glass_empty.png"
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }

        ComboBox {
            id: box3_list
            y: (parent.height)
            width: boxWidth
            model: ["First", "Second", "Third"]
        }


    }

//////////////////////////////////////////////////////////////////// BOX 4 /////////////////////////////////////////////////////////////////////

    Rectangle {
        id: box4
        x: (parent.width/2+parent.width/3)-width/2
        y: (parent.height/2-parent.height/3)-height/2
        width: boxWidth
        height: boxHeight
        color: "#17b1aa"
        radius: 20


        Image {
            id: box4_ico
            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: 64
            height: 64
            source: "static/shot-glass_empty.png"
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }

        ComboBox {
            id: box4_list
            y: (parent.height)
            width: boxWidth
            model: ["First", "Second", "Third"]
        }


    }

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
            fillLists(["First1", "Second", "Third"])

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
