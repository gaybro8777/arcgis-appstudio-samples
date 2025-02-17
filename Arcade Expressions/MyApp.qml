/* Copyright 2020 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12

import ArcGIS.AppFramework 1.0

import './controls' as Controls

App {
    id: app
    width: 400
    height: 640

    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int  baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(450)
    property url  qmlfile
    property string sampleName
    property string descriptionText

    Page {
        id: mainPage
        anchors.fill: parent
        header: ToolBar {
            id:header
            width: parent.width
            height: 50 * scaleFactor
            Material.background: "#8f499c"
            Controls.HeaderBar{}
        }
        contentItem: Rectangle {
            id: loader
            anchors.top:header.bottom
            Loader{
                height: app.height - header.height
                width: app.width
                source: qmlfile
            }
        }
    }

    Controls.FloatActionButton{
        id:switchBtn
    }

    Controls.PopUpPage{
        id:popUp
        visible:false
    }

    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

