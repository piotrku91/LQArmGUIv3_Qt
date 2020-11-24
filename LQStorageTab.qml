import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: lqstorage
    width: 640; height: 480
    anchors.fill: parent
    anchors.margins: 20



    Button {
        x: 400
        y: 400
        text: "eeeeeeee"

        onClicked: {slots.itemAt(0).color="red"}


    }


    Row {
        Repeater {
            id: slots
            model: 9
            Rectangle {
                width: lqstorage.width/9; height: 300
                border.width: 1
                color: "white"

                TextArea
                { text: index
                    readOnly: true
                }

                Image {
                    id: slot_ico
                    x: parent.width/2-width/2
                    y: parent.height/2-height/2
                    width: 64
                    height: 64
                    source: "static/bottle.png"
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                TextArea
                {
                    id: slot_ml

                    y: slot_pgbar.y-20
                    text: slot_actualml.text+ " / " +slot_maxml.text+" ml"
                    width: parent.width
                    x: slot_pgbar.x-20
                    color: "black"
                    readOnly: true

                }

                ProgressBar {
                    id: slot_pgbar
                    value: slot_actualml.text
                    to: slot_maxml.text
                    x: parent.width/2-width/2
                    y: parent.height/4
                    width: 64
                    height: 16
                }



                TextField
                {
                    id: slot_name

                    y: parent.height-35
                    text: "default"
                    width: parent.width
                    color: "black"

                }

                TextField
                {
                    id: slot_id
                    font.capitalization: Font.AllUppercase
                    y: parent.height
                    text: "BRAK"
                    width: parent.width
                    maximumLength: 4
                    color: "red"

                }

                TextField
                {
                    id: slot_actualml
                    inputMethodHints: Qt.ImhDigitsOnly
                    y: parent.height+35
                    text: "0"
                    width: parent.width
                    color: "black"

                }
                TextField
                {
                    id: slot_maxml
                    inputMethodHints: Qt.ImhDigitsOnly
                    y: slot_actualml.y+35
                    text: "1500"
                    width: parent.width
                    color: "black"

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
