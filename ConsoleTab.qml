/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import io.qt.examples.backend 1.0


Item {
    property alias newcmd: newcmd
    property alias sendTrigger: sendTrigger
    property alias mainconsole: mainconsole


    Connections {
        target: serial
        onGetNewData: {  mainconsole.newLine(data,"DEVICE","pink")}
        onGetLog: { mainconsole.newLine(Line,"SYSTEM","yellow") }
                }

    id: element
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.fill: parent; anchors.bottomMargin: 45;
        color: "#000008"   // Color of console background

        TextEdit {
            id: mainconsole
            textFormat: TextEdit.RichText
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.leftMargin: 5
            text: "["+clocky.getTime() +"] ** Witaj w LQArmGUI :) \n"
            font.family: "Verdana"
            font.bold: true
            font.pointSize: 8
            color: "#80FF00"  // Color of console font
            readOnly: true

            function newLine(cmd,ifc,clr)
            {
              cmd = cmd.replace("<","&lt;")
              cmd =  cmd.replace(">","&gt;")
              cmd = cmd.replace("\n","<br>")
              append('<font style="color:'+clr+';">['+clocky.getTime()+ '] '+ifc+": "+cmd+'</font>')


            }


        }

    }


    TextField {
        id: newcmd
        width: parent.width-150
        text: "<cmp;3;3;>";
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.verticalCenterOffset: 96
        anchors.horizontalCenterOffset: -30
        placeholderText: qsTr("Send some command to device")



        onTextChanged:;
    }

    Button {
        id: sendTrigger
        text: "OK"

        width: 45
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 1
        anchors.verticalCenterOffset: 96
        anchors.horizontalCenterOffset: -30


        onClicked: {
            mainconsole.newLine(newcmd.text,"GUI","red")
            serial.writeSlot(newcmd.text+"\r\n")
        newcmd.text=""

        }

    }


}
