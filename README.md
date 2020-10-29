⚠️⚠️⚠️就是跟以前不一樣的⚠️⚠️⚠️

☘️☘️☘️就是類似的或替代品☘️☘️☘️

### [Lesson 0 - 開場白](https://ithelp.ithome.com.tw/articles/10237645)
* 就做個開場
* 然後介紹了一些學習資源

### [Lesson 1 - 依然哈囉](https://ithelp.ithome.com.tw/articles/10237866)
* 可以選擇用AS或VSCode
* 要自己下載[SDK](https://flutter.dev/docs/get-started/install/macos)⚠️⚠️⚠️
* 環境建立的詳細步驟
* 從AS就可以執行iOS模擬器了
* 就算是接實機也可以hot reload⚠️⚠️⚠️

### [Lesson 2 - 第一印象](https://ithelp.ithome.com.tw/articles/10237867)
![](https://i.imgur.com/ntkau1p.png)
* Flutter專案裡還是有iOS跟Android資料夾
* 所以換icon基本上還是跟以前一樣的方法
* 當然你想要兩個平台用不一樣的icon也可以
* 也可以用[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)方便替換
* iOS還是用LaunchScreen.storyboard☘️☘️☘️
* Android有分：
launch screens(啟動頁)：等待Android初始化
splash screens(閃屏頁)：等待Dart初始化

### [Lesson 3 - 頁面跳轉](https://ithelp.ithome.com.tw/articles/10239301)
![](http://fp1.fghrsh.net/2020/08/17/adc569aacce27297339e9c9576bfe88a.gif)
* Flutter裡的世界裡什麼都是Widget
就先把它當成UIView吧☘️☘️☘️
* 有分StatelessWidget 跟 StatefulWidget
盡量少用StatefulWidget
除非會根據User或API改變的畫面
* 跟ViewController比較像的東西應該算是Scaffold☘️☘️☘️
* Flutter畫面不能用拉的⚠️⚠️⚠️
* 有一些部分(像是頁面跳轉)會根據不同的平台自動轉換行為
* subview現在叫child/children☘️☘️☘️
* 跳頁的語法也滿像的`Navigator.push`

### [Lesson 4 - 畫面佈局](https://ithelp.ithome.com.tw/articles/10239397)
![](https://i.imgur.com/cC5cMs3l.png)
* 關於Layout我感覺：以前像是決定要把View放在哪裏, 現在像是要把畫布分割區塊⚠️⚠️⚠️
* 很常用到Column/Row(就是UIStackView☘️☘️☘️)
* Row是水平排列, Column是垂直排列
* Expanded`只能`在Flex裡使用
* 要把物件重疊就用Stack

### [Lesson 5 - 容器元件](https://ithelp.ithome.com.tw/articles/10241240)
![](https://i.imgur.com/zuMRNiN.jpg)
* 以前iOS沒有下面這些UI類別⚠️⚠️⚠️
* Align讓子widget對齊特定位置(九宮格)
* Padding讓子widget留邊距
* DecoratedBox裝飾子widget, 背景色或實現一些以前要在UIView.layer陰影/邊線/圓角做的事☘️☘️☘️
* SizedBox指定子widget大小
* Container是綜合上述多功能的Widget, 有時候直接用Container省得改來改去

### [Lesson 6 - 文字顯示與輸入](https://ithelp.ithome.com.tw/articles/10241330)
![](https://i.imgur.com/mqYkIPOl.png)
* Text不是String是UILable⚠️⚠️⚠️
* Text預設會自動折行, 不用怕忘記改行數了⚠️⚠️⚠️
* TextField要透過controller物件才能控制它⚠️⚠️⚠️

| Android  | iOS | Flutter |
| -------- | -------- | ------ |
| TextView | UILabel    | Text
| EditText | UITextField | TextField

### [Lesson 7 - 按鈕與對話方塊](https://ithelp.ithome.com.tw/articles/10241982)
![](https://i.imgur.com/Q1cdiSj.gif)
* 按鈕透過onPressed callback來處理點擊事件
* onPressed為null按鈕就會強制變成disable
* 以前我們在用的UIControl都可以在[這裡](https://flutter.dev/docs/development/ui/widgets/cupertino)找到
* Alert要自己呼叫Navigator.pop才會關掉⚠️⚠️⚠️
* 使用async/await才能取得Alert的結果

| Android | iOS | Flutter |
| -------- | -------- | -
| Button | UIButton    | RawMaterialButton
| Dialog | UIAlertController | AlertDialog

### [Lesson 8 - 圖片](https://ithelp.ithome.com.tw/articles/10241989)
![](https://i.imgur.com/0fIA9nT.gif)

![](https://i.imgur.com/KzZWSjD.png)
* UIImageView就是Image, UIImage就是ImageProvider☘️☘️☘️
* 使用圖片路徑跟副檔名都要⚠️⚠️⚠️
* 內建讀取網路圖片功能⚠️⚠️⚠️

| Android | iOS | Flutter |
| -------- | -------- | -
| ImageView | UIImageView | Image
| Bitmap | UIImage | ImageProvider
| ScaleType | UIViewContentMode | BoxFit

### [Lesson 9 - 選擇器](https://ithelp.ithome.com.tw/articles/10242501)
[![Yes](https://img.youtube.com/vi/aNU25QvHKAE/0.jpg)](https://www.youtube.com/watch?v=aNU25QvHKAE)
* 注意showBottomSheet跟showModalBottomSheet是兩個不一樣的方法

| Android | iOS | Flutter(Material) | Flutter(Cupertino) |
| -------- | -------- | - | -
| Spinner | UIPickerView | showBottomSheet | CupertinoActionSheet
| DatePickerDialog | UIDatePicker | showDatePicker/showTimePicker | CupertinoDatePicker

### [Lesson 10 - 建立列表](https://ithelp.ithome.com.tw/articles/10244373)
![](https://i.imgur.com/iGVLM71.jpg)

![](https://i.ibb.co/vkgHb76/5acba-mhty5.gif)
* TableView叫List☘️☘️☘️
* cell叫ListTile☘️☘️☘️
* 可以橫的⚠️⚠️⚠️
* 也是要靠scrollController
* 有children(一次全建) 跟 builder(要顯示才建立)兩種建立方式

| Android | iOS | Flutter |
| -------- | -------- | - 
| ListView | UITableView static cell | ListView use children
| RecycleView | UITableView dynamic cell |  ListView.builder

### [Lesson 11 - 列表置頂與刷新](https://ithelp.ithome.com.tw/articles/10245363)
![](https://i.imgur.com/oOn04hH.gif) ![](https://i.imgur.com/aen9pt7.gif)
* 沒有section的概念⚠️⚠️⚠️
* 置頂header使用[sticky_headers](https://pub.dev/packages/sticky_headers)套件

### [Lesson 12 - 列表輸入與折疊](https://ithelp.ithome.com.tw/articles/10245635)
![](https://i.imgur.com/zWWGMNd.gif) ![](https://i.imgur.com/V1pXkgo.gif)
* children方式建立的ListView其TextField上的資料還是會跑掉
* 用ExpansionTile就可以做到folding效果

### [Lesson 13 - 列表多選與側滑](https://ithelp.ithome.com.tw/articles/10245937)
![](https://i.imgur.com/AkD2UI9.gif) ![](https://i.imgur.com/LrkUOsr.gif)
* 要做多選會用CheckboxListTile
* 側滑選項的話使用[flutter_slidable](https://pub.dev/packages/flutter_slidable)
* 簡單提示訊息可以用SnackBar


### [Lesson 14 - 網格](https://ithelp.ithome.com.tw/articles/10246747)
![](https://i.imgur.com/yLN2s3ml.png)
* 直接幫你算好cell大小(爽爽的)⚠️⚠️⚠️
* 但是不能paging scroll⚠️⚠️⚠️

| Android | iOS | Flutter | 
| -------- | -------- | - | 
| RecycleView(set GridLayoutManager) | UICollectionView | GridView 

### [Lesson 15 - 特製滾動](https://ithelp.ithome.com.tw/articles/10246874)
![](https://i.imgur.com/LooPItF.gif)
* CustomScrollView就像CompositionalLayout☘️☘️☘️
* CustomScrollView裡面一定要用Sliver Widget
* CupertinoSliverRefreshControl就是在CustomScrollView使用

### [Lesson 16 - 底部導航與頁籤](https://ithelp.ithome.com.tw/articles/10246950)
![](https://i.imgur.com/AHruqWP.gif)
* BottomNavigationBar這個是TabBar☘️☘️☘️
* TabController這個不是TabBar...在iOS我不知道叫什麼, 就是那個可以用手勢換頁的
* BottomNavigationBar有分fixed 跟 shifting兩種Type
* 注意BottomNavigation超過三個就會轉成shifting
* BottomNavigation的換頁必須自己管理

| Android | iOS | Flutter | 
| -------- | -------- | - | 
| BottomNavigationView | UITabBarController | BottomNavigationBar 
| TabbedActivity | 看套件叫什麼它就叫什麼 | TabController 

### [Lesson 17 - API GET](https://ithelp.ithome.com.tw/articles/10247790)
![](https://i.imgur.com/z7dWbsx.gif)
* 唔...這天沒什麼重點XD, 就介紹一下怎麼轉Model跟打API

### [Lesson 18 -API POST](https://ithelp.ithome.com.tw/articles/10248231)
![](https://i.imgur.com/ruRsP0g.gif)
* Flutter內建的`HttpClient`功能比較陽春, POST好像只支援application/json
* 完整一點的可以使用官方出的[套件](https://pub.dev/packages/http)`http`
* 或是第三方的[Dio](https://pub.dev/packages/dio)

### [Lesson 19 - Life Cycle](https://ithelp.ithome.com.tw/articles/10249417)
![](https://i.imgur.com/Civd0tO.gif)
![][https://i.imgur.com/lCg6cWh.gif]
* Widget生命週期跟iOS/Android不太一樣, 沒有will/did相關的
* App生命週期要widget透過WidgetsBindingObserver自己監聽

| iOS | Android | Flutter
| -------- | -------- | -
| init | onCreate | createState
| viewDidLoad | | initState
| viewWillAppear |onStart | 這個沒有真的滿傷的⚠️⚠️⚠️
| viewDidLayoutSubviews |  | build
| viewDidAppear	| onResume
| viewWillDisappear | onPause
| viewDidDisappear | onStop
| removeFromSuperview |  | deactivate
| deinit | onDestroy | dispose
| WillEnterForeground	| onRestart
| DidBecomeActive | onStart | resumed
| WillResignActive | onPause | 這個沒有對金融業也滿傷的⚠️⚠️⚠️
| DidEnterBackground	| onStop | paused

### [Lesson 20 -InheritedWidget](https://ithelp.ithome.com.tw/articles/10249766)
![](https://i.imgur.com/v6VuHZW.gif)
* UI樹一層包一層, 若底層的widget若想取得上層的state會很麻煩
* InheritedWidget讓底層widget可以方便取得上層的state
* 類似Singleton的作用☘️☘️☘️
* InheritedWidget更新了就會呼叫didChangeDependencies

### [Lesson 21 -Provider](https://ithelp.ithome.com.tw/articles/10250556)
![](https://i.imgur.com/YfMi9b7.gif)
* 就是進階版的InheritedWidget套件
* 可以做到以前NotificationCenter的效果☘️☘️☘️
* 如果要做到push到2ndVC時TabBar還在
就要Scaffold/TabBar/TabView整套換成Cupertino
* 如果要做到push到2ndVC時點TabBarItem可以popToRootVC
就要用navigatorKey去找到navigator再去`popUntil`

### [Lesson 22 - Notification](https://ithelp.ithome.com.tw/articles/10250798)
![](https://i.imgur.com/GhX9Wxd.gif) ![](https://i.imgur.com/hWkC6YL.gif)
* 也是類似NotificationCenter☘️☘️☘️
* 只是現在方向由下往上
* 畫這個金字塔比實作Notification麻煩XD

### [Lesson 23 - ImagePicker](https://ithelp.ithome.com.tw/articles/10251298)
![](https://i.imgur.com/86T3tNU.gif)
* 要另外裝[image_picker](https://pub.dev/packages/image_picker)
* 取得path之後, 透過path拿到File, 再用Image.file顯示

### [Lesson 24 - Local Storage + URL Launcher](https://ithelp.ithome.com.tw/articles/10251525)
[![Yes](https://img.youtube.com/vi/DqzqVV_MSqw/0.jpg)](https://www.youtube.com/watch?v=DqzqVV_MSqw)

![](https://i.imgur.com/i0ulXPy.gif)
* [SharedPreferences](https://pub.dev/packages/shared_preferences)就是UserDefault☘️☘️☘️
* [url_launcher](https://pub.dev/packages/url_launcher)就像openURL☘️☘️☘️
* 不過開網頁不是外開Safari了, 而是使用SFSafariViewController⚠️⚠️⚠️

### [Lesson 25 - Push Notification](https://ithelp.ithome.com.tw/articles/10251896)
![](https://i.imgur.com/Aa2Pd6x.gif)
* 多圖詳細設定步驟
* 現在憑證都用.p8了

### [Lesson 26 - Biometric](https://ithelp.ithome.com.tw/articles/10252385)
[![Yes](https://img.youtube.com/vi/mNSV7PHWvlI/0.jpg)](https://www.youtube.com/watch?v=mNSV7PHWvlI)
* 使用[local_auth](https://pub.dev/packages/local_auth)
* 不會拿到拒絕原因(LAError)⚠️⚠️⚠️

### [Lesson 27 - Map + Location](https://ithelp.ithome.com.tw/articles/10252721)
![](https://i.imgur.com/Ojoq2HC.gif)
* 要用Google Maps要先去CGP上面申請API Key
* 有提供my location button
* 要注意要求定位權限的時機要晚一點, 才不會卡在過場動畫

### [Lesson 28 - flutter_turtle](https://ithelp.ithome.com.tw/articles/10253167)
![](https://i.imgur.com/4zMDrcYl.png)

* 體驗`Zonble`大大有趣的side project
* 詳細介紹可以看看他本人寫的這篇[Medium](https://medium.com/@zonble/%E5%9C%A8-flutter-%E8%A3%A1%E9%A0%AD%E7%94%A8%E5%B0%8F%E7%83%8F%E9%BE%9C%E7%95%AB%E5%9C%96-90efa8108011)
