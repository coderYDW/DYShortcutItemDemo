# 3D-touch API - Home Screen Quick Actions


3D-touch目前有两种使用方式

- Home Screen Quick Actions 应用图标的快捷按钮
- UIKit Peek and Pop 预览,窥探


## Home Screen Quick Actions

应用快速操作分为静态和动态两种

- 静态

> Static quick actions are available to the user immediately upon app installation. Define Home screen static quick actions in your app’s Info.plist file in the UIApplicationShortcutItems array.

静态方式通过info.plist的方式来实现


- 动态

> Dynamic quick actions are available to the user after first launch. Define Home screen dynamic quick actions with the UIApplicationShortcutItem, UIMutableApplicationShortcutItem, and UIApplicationShortcutIcon classes. Add dynamic quick actions to your app’s shared UIApplication object using the shortcutItems property.

动态方式通过创建UIApplicationShortcutItem, UIMutableApplicationShortcutItem和UIApplicationShortcutIcon对象,并在应用第一次启动的时候添加到UIApplication的shortcutItems数组里面来实现

> iOS 9 displays up to four Home screen quick actions for your app. Within this limit, the system shows your static quick actions first, starting at the topmost position in the menu. If your static items do not exhaust the limit and you have also defined dynamic quick actions, then one or more of your dynamic quick actions is displayed.

iOS 9 默认的先显示静态的快速操作,如果静态的快捷方式没有超过4个,再去显示动态的快速操作,一共可以显示4个快捷方式.

### UIApplicationShortcutItem

> An application shortcut item, also called a Home screen dynamic quick action, specifies a user-initiated action for your app.

这个类就是一个快速操作类,创建一个这个类就相当也创建了一个快速操作

主要属性如下:

- localizedTitle 

> The required, user-visible title for the Home screen dynamic quick action.  
 
必须的 快速操作的标题


- localizedSubtitle

> The optional, user-visible subtitle for the Home screen dynamic quick action. 
 
可选的 快速操作的副标题

- type 

> A required, app-specific string that you employ to identify the type of quick action to perform. 
 
必须的 快速操作的类型 用来标识执行的快速操作类型

- icon 

> The optional icon for the Home screen dynamic quick action. 
 
可选的 快速操作的图标 会被渲染成同一种颜色

- userinfo 

> Optional, app-specific information that you can provide for use when your app performs the Home screen quick action.

可选的 用户信息 可以在用户执行快速操作的时候传递给用户

### code

- 静态的快速操作实现方式

在info.plist里面添加如下代码:

```
<key>UIApplicationShortcutItems</key>
    <array>
        <dict>
            <key>UIApplicationShortcutItemIconFile</key>
            <string>open-favorites</string>
            <key>UIApplicationShortcutItemTitle</key>
            <string>Favorites</string>
            <key>UIApplicationShortcutItemType</key>
            <string>com.mycompany.myapp.openfavorites</string>
            <key>UIApplicationShortcutItemUserInfo</key>
            <dict>
                <key>key1</key>
                <string>value1</string>
            </dict>
        </dict>
        <dict>
            <key>UIApplicationShortcutItemIconType</key>
            <string>UIApplicationShortcutIconTypeCompose</string>
            <key>UIApplicationShortcutItemTitle</key>
            <string>New Message</string>
            <key>UIApplicationShortcutItemType</key>
            <string>com.mycompany.myapp.newmessage</string>
            <key>UIApplicationShortcutItemUserInfo</key>
            <dict>
                <key>key2</key>
                <string>value2</string>
            </dict>
        </dict>
    </array>
```

效果如图:

![tupian](http://a3.qpic.cn/psb?/V13Ogsjv1OZ9Bj/1lEAL1HFjkUHs31iSYJV3slr5kLlqMT1Yf989JGlu6o!/b/dGcBAAAAAAAA&bo=gAJyBAAAAAADB9Y!&rf=viewer_4)


- 动态的快速操作实现方式

