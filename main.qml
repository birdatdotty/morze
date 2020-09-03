import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15

import su.dotty.morze 1.0

Window {
    visible: true
    width: 640
    id: main
    height: 480
    title: qsTr("Hello World")
    ScrollView {
        id: view
        x: 10
        y: 10
        height: 400
        width: 224
        TextArea {
            id: enRu
            text: "TextArea2\n...\n...\n...\n...\n...\n...\n"
        }
    }

    ScrollView {
        id: view2
        x: 510
        y: 10
        height: 400
        width: 224

        TextArea {
            id: morza
            text: "TextArea1\n...\n...\n...\n...\n...\n...\n"
        }
    }

    Row {
        x: 0
        y: 417

        Button {
            width: 224
            height: 40
            text: "на морзе"
            onClicked: morza.text = morze.trans(enRu.text, morze.EN);
        }
        Button {
            width: 224
            height: 40
            text: "на русский язык"
            onClicked: enRu.text = morze.reTrans(morza.text, Morze.RU);
        }
        Button {
            width: 224
            height: 40
            text: "на английский язык"
            onClicked: enRu.text = morze.reTrans(morza.text, Morze.EN);
        }
    }




}
