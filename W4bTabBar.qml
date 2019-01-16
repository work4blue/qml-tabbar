/*!
 *@file BaseTabBar.qml
 *@brief 自定义TabBar
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0


TabBar
    {
    property alias myModel: myModel
    property int lastIndex: 0
    property string highColor: "#148014"
    property string normalColor: "#000000"

    background: Rectangle{
        Rectangle{ //顶部分割线实现
          id: separtline

          width: parent.width
          height: 1;
          color: "#e3e3e3"
      }
        color: "white"
    }


    id: bar
    currentIndex: 0
    height: 50
    spacing: 0
    bottomInset: 2
//    padding :{
//            top: 0;left: 0;right: 0
//            bottom: 2

//        }

    //background: "#FF00FF"

    ListModel {
        id: myModel
    }





    Repeater {
        id: repeater
        model: myModel

        TabButton {
            property alias imageSource: tabImage.source
            property alias textColor: text.color

                background: Rectangle{
                    color: "#FFFFFF"

                    Rectangle{
                            id:iconnew
                            width: 16
                            height: 16
                            color: "red"
                            radius:(newMsg>10?6:height/2)
                            visible:(newMsg>0)
                     anchors.horizontalCenter: parent.horizontalCenter
                      anchors.horizontalCenterOffset:  width+2
                            anchors.top: parent.top
                            Item{
                                anchors.fill: parent
                                Text {
                                    id: tasknumber2
                                    anchors.centerIn: parent
                                    font.pointSize:10
                                    color:"#ffffff"
                                    text: newMsg>99?"...":newMsg.toString()
                                }
                            }
                        }
                }

            height: bar.height
            contentItem:Column{

               // property  alias textColor: text.textColor
                Image{
                    id: tabImage
                    width: 24
                    height: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: (model.index === bar.currentIndex) ? modelSrcG : modelSrc
                }
                Text {
                id: text
                text: modelText

               // horizontalAlignment: Text.AlignHCenter
               // verticalAlignment: Text.AlignBottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: (model.index === bar.currentIndex) ? highColor : normalColor

              }

            }
            onHoveredChanged: {
                if (model.index !== bar.currentIndex){
                    hovered ? text.color = highColor : text.color = normalColor
                    hovered ? tabImage.source = modelSrcG : tabImage.source = modelSrc
                }
            }

        }
    }

   onCurrentIndexChanged: {
       console.debug("currentIndex",currentIndex)

       repeater.itemAt(bar.lastIndex).imageSource = myModel.get(bar.lastIndex).modelSrc;
       repeater.itemAt(bar.lastIndex).textColor = normalColor;

      bar.lastIndex = currentIndex
       repeater.itemAt(bar.lastIndex).imageSource = myModel.get(bar.lastIndex).modelSrcG;
       repeater.itemAt(bar.lastIndex).textColor = highColor;

   }
}
