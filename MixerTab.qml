import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Item {
    id: mixert
    anchors.fill: parent

    ComboBox {
        id: kombo
        x: 20
        width: 559
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 20
        model: mixer.getTest()


        onCurrentIndexChanged: {mixer.itemIndex=currentIndex}
    }

    TextField {
        text: String(mixer.itemIndex)
        anchors.horizontalCenterOffset: -180
        anchors.verticalCenterOffset: 150
        placeholderText: qsTr("User name")
        anchors.centerIn: parent
    }






}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
