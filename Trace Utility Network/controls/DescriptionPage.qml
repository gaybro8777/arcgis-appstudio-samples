import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

import ArcGIS.AppFramework 1.0

Item {
    id: descPage
    width: parent.width
    height: parent.height

    Rectangle{
        anchors.fill:parent

        ColumnLayout{
            anchors.fill:parent
            spacing: 0
            clip:true

            Rectangle{
                id:descPageheader
                color:"#8f499c"
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 50 * scaleFactor

                ToolButton {
                    id:infoImage
                    indicator: Image{
                        width: 30 * scaleFactor
                        height: 30 * scaleFactor
                        anchors.centerIn: parent
                        horizontalAlignment: Qt.AlignRight
                        verticalAlignment: Qt.AlignVCenter
                        source: "../assets/clear.png"
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                    }
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }
                    onClicked: {
                        descPage.visible = 0
                    }
                }


                Text {
                    id: aboutApp
                    text:qsTr("About")
                    color:"white"
                    font.pixelSize: app.baseFontSize * 1.1
                    font.bold: true
                    anchors.centerIn: parent
                    maximumLineCount: 2
                    elide: Text.ElideRight
                }
            }

            Rectangle{
                color:"black"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Flickable {
                    anchors.fill:parent
                    contentHeight: descText.height
                    clip:true

                    Text{
                        id: descText
                        y: 30 * scaleFactor
                        text:app.info.description
                        anchors.horizontalCenterOffset: 0
                        color:"white"
                        width: 0.85 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        linkColor: "#e5e6e7"
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        anchors.horizontalCenter: parent.horizontalCenter
                        font {
                            pixelSize: app.baseFontSize
                        }
                        onLinkActivated: Qt.openUrlExternally(link)
                    }
                }
            }
        }
    }
}





