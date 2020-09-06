import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15

import QtQuick.Controls.Styles 1.4


import su.dotty.morze 1.0

ApplicationWindow {
    visible: true
    width: 640
    id: main
    height: 480
    title: qsTr("Hello World")

    Component {
        TextArea{}
    }

    function tabView() {
        console.log("morza.focus", morza.focus, morza.activeFocus)
        console.log("enRu.focus", enRu.focus, enRu.activeFocus)
    }



    GridLayout {
        id: gridLayout
        rowSpacing: 0
        anchors.fill: parent
        rows: 2
        columns: 2
        columnSpacing: 0

        ScrollView {
            focus: true
            id: view
            Layout.row: 0
            Layout.column: 0

            Layout.fillHeight: true
            Layout.preferredWidth: gridLayout.width / 2

            TextArea {
                KeyNavigation.right: morza
                focus: true
                id: enRu

                Keys.onTabPressed: {nextItemInFocusChain().forceActiveFocus(Qt.TabFocusReason); tabView();}
                Keys.onReturnPressed: morza.text = morze.trans(enRu.text);

                text: "TextArea1 TextArea1 "
                wrapMode: Text.WordWrap
                background: Rectangle {
                    color: parent.parent.activeFocus ?  "#f9f9f9" : "#eee"
//                    color: focus ? "#ccc" : "#fff"
                }
                Text {
                    anchors.bottom: parent.bottom
                    text: enRu.activeFocus ? "I have active focus!" : "I do not have active focus"
                }
            }
        }

        ScrollView {
            id: view2
            Layout.row: 0
            Layout.column: 1

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: gridLayout.width / 2

            TextArea {
                id: morza
//                text: "TextArea2"
                text: morze.trans(enRu.text, morze.EN);

                Keys.onTabPressed: {nextItemInFocusChain().forceActiveFocus(Qt.TabFocusReason);tabView();}

//                focus: true
                wrapMode: Text.WordWrap
                background: Rectangle {
                    color: parent.parent.activeFocus ?  "#f9f9f9" : "#eee"
                }
                Text {
                    anchors.bottom: parent.bottom
                    text: morza.activeFocus ? "I have active focus!" : "I do not have active focus"
                }
            }
        }

        RowLayout {
            spacing: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 2

            Button {
                Layout.fillWidth: true
                focusPolicy: "NoFocus"

                text: "на морзе"
                onClicked: morza.text = morze.trans(enRu.text, morze.EN);
            }
            Button {
                Layout.fillWidth: true
                focusPolicy: "NoFocus"

                text: "на русский язык"
                onClicked: enRu.text = morze.reTrans(morza.text, Morze.RU);
            }
            Button {
                Layout.fillWidth: true
                focusPolicy: "NoFocus"

                text: "на английский язык"
                onClicked: enRu.text = morze.reTrans(morza.text, Morze.EN);
            }
        }



    }




}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}
}
##^##*/
