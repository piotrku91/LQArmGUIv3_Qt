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


ApplicationWindow {
    property color layout_color_main1: "#f9842d"
    property color layout_color_main2: "#47b2ce"
    property color layout_color_backgrounds: "#ebb88e"


    id: window
    visible: true
    visibility: "FullScreen"
    width: 640
    height: 480
    onClosing: { manager.saveLogToFile(consoleacc.mainconsole.text);}



TabWidget {
    id: tabs
    width: 640; height: 480
    anchors.fill: parent




////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Rectangle {

        property string title: "Konsola"
        property string img: "console"
        anchors.fill: parent
        color: "#e3e3e3"



        Rectangle {
            anchors.fill: parent; anchors.margins: 0
            color: layout_color_backgrounds
            enabled: (tabs.current===0) ? true:false


            ConsoleTab { id: consoleacc
                } // ConsoleTab.qml



        }
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Rectangle {
        property string title: "Stan stołu"
        property string img: "table"
        anchors.fill: parent
        color: "#e3e3e3"


        Rectangle {
            anchors.fill: parent; anchors.margins: 0
            color: layout_color_backgrounds
            enabled: (tabs.current===1) ? true:false




          StatusTableTab { }


        }
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Rectangle {
            property string title: "Konfiguracja"
            property string img: "solar-system"
            anchors.fill: parent
            color: "#e3e3e3"


            Rectangle {
                anchors.fill: parent; anchors.margins: 0
                color: layout_color_backgrounds
                enabled: (tabs.current===2) ? true:false




                ConfigurationTab {}



            }
        }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Rectangle {
                property string title: "Magazyn napojów"
                property string img: "whiskey"
                anchors.fill: parent
                color: "#e3e3e3"


                Rectangle {
                    anchors.fill: parent; anchors.margins: 0
                    color: layout_color_backgrounds
                    enabled: (tabs.current===3) ? true:false




               LQStorageTab {}


                }
            }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////




    Rectangle {
        property string title: "Menedżer drinków"
        property string img: "cocktail"
        anchors.fill: parent; color: "#e3e3e3"

        Rectangle {
            anchors.fill: parent; anchors.margins: 0
            color: layout_color_backgrounds
            enabled: (tabs.current===4) ? true:false
            MixerTab{}
        }
    }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}


}

