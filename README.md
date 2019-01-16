
QML tabBar 默认是Material 风格,默认只能顶部Tab 使用,象常用软件底部tabBar 风格.需要自己扩展

参考 https://blog.csdn.net/zhengtianzuo06/article/details/78287088

最终实现效果如下:

![image.png](https://upload-images.jianshu.io/upload_images/1493747-fecef4ac081e908a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


包括常数字小红点通知也实现.核心代码W4BTabBar.qml 直接拷入项目即可使用



但是还有一些细节,还可以改进,
比如
+ 小红点在图标下面.较长数字显示起来很怪,
+ 未选中图片是需要单独一个图片,实际上可以用算法对选中图片直接进行灰化处理即可
+ 测试发现,tabBar图片的作背景显示是可以超过tabBar本身的,因此在Android/iOS 很难实现异形TabBar很容易实现.只要tabBar 图片本身高度超过

完整源码参见
https://github.com/work4blue/qml-tabbar
好用请start 一下
