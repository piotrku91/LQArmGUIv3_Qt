import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: lqstorage
    width: 640; height: 480
    anchors.fill: parent
    anchors.margins: 20

    function updatesl()
    {
        for (var i = 0; i < 9; i++) {
           slots.itemAt(i).children[5].text=slotmaster.getIDName(i);
           slots.itemAt(i).children[6].text=slotmaster.getActualML(i);
           slots.itemAt(i).children[7].text=slotmaster.getMaxML(i);
        }

    }

    function updatess()
    {
        for (var i = 0; i < 9; i++) {

           slotmaster.setIDName(i,slots.itemAt(i).children[5].text);
           slotmaster.setActualML(i,slots.itemAt(i).children[6].text);
           slotmaster.setMaxML(i,slots.itemAt(i).children[7].text);
        }

    }

    Connections {
        target: slotmaster


        onPushUpdate:
        {
          updatesl();
        }
                }

    Button {
        x: 500
        y: 500
        text: "Przywróć ostatnie"

        onClicked: {   updatesl(); }

    }

    Button {
        x: 650
        y: 500
        text: "Zapisz"

        onClicked: {   updatess(); }

    }



    Row {
        Repeater {
            id: slots
            model: 9
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
                //    onTextChanged: {slotmaster.setActualML(index,text);}


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


            }


        }
    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
