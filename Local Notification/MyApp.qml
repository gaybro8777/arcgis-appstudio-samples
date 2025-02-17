/* Copyright 2021 Esri
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

import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Notifications 1.0
import ArcGIS.AppFramework.Notifications.Local 1.0

import "controls" as Controls

App {
    id: app
    width: 414
    height: 736

    Material.accent: "#8f499c"
    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    Page{
        anchors.fill: parent
        header: ToolBar{
            id:header
            width: parent.width
            height: 50 * scaleFactor
            Material.background: "#8f499c"
            Controls.HeaderBar{}
        }

        // sample starts here ------------------------------------------------------------------
        contentItem: Rectangle{
            anchors.top:header.bottom
            ColumnLayout {
                spacing: 10
                anchors.centerIn: parent

                TextField {
                    id: title
                    placeholderText: "Enter Title"
                }

                TextField {
                    id: message
                    placeholderText: "Enter Message"
                }

                TextField {
                    id: duration
                    placeholderText: "Enter time delay (milliseconds)"
                }

                Button {
                    width: 250
                    text: "schedule"
                    onClicked: {
                        console.log(notification.schedule(title.text, message.text, duration.text))
                    }
                }

                RowLayout {

                    Button {
                        width: 200
                        text: "notification supported"
                        onClicked: {
                            notificationSupported.text = notification.supported ? "Yes" : "No";
                        }
                    }

                    Text {
                        id: notificationSupported
                        width: 150
                        text: "don't know"
                    }
                }

                RowLayout {

                    Button {
                        text: "clear notification"
                        onClicked: {
                            console.log(notification.clearAll())
                            title.text = ""
                            message.text = ""
                            duration.text = ""
                        }
                    }
                }
            }

            LocalNotification {
                id: notification

                onTriggered: {
                    console.log("Triggered id: ", id)
                }
            }
        }
    }

    // sample ends here ------------------------------------------------------------------------
    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

