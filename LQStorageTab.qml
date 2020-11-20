import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: lqstorage
    width: 640; height: 480

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


            }


        }
    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
