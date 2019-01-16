/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

ApplicationWindow {
    visible: true
    id: frmWindow
    width: 480
    height: 640
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        //anchors.fill: parent
        height: frmWindow.height - tabBar.height
        width: parent.width
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }

        Page3Form {
        }

        Page4Form {
        }
    }

    footer: W4bTabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        width: parent.width
        Component.onCompleted: {
            myModel.append({ "modelText": "消息",   "modelSrc": "qrc:/images/Chat_MsgRecord.svg", "modelSrcG": "qrc:/images/Chat_MsgRecordG.svg","newMsg":4})
            myModel.append({ "modelText": "联系人",   "modelSrc": "qrc:/images/Chat_FriendManager.svg", "modelSrcG": "qrc:/images/Chat_FriendManagerG.svg","newMsg":0})
            myModel.append({ "modelText": "发现",    "modelSrc": "qrc:/images/Mobile_Find.svg", "modelSrcG": "qrc:/images/Mobile_FindG.svg","newMsg":99})
            myModel.append({ "modelText": "我",    "modelSrc": "qrc:/images/Main_P2PChat.svg", "modelSrcG": "qrc:/images/Main_P2PChatG.svg","newMsg":3000})
        }
    }
}


