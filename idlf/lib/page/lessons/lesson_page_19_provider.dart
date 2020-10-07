import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import 'lesson_page_14_bottomNavigation_tabBar.dart';

class LessonPageProvider extends StatefulWidget {
  @override
  _LessonPageProviderState createState() => _LessonPageProviderState();
}

class _LessonPageProviderState extends State<LessonPageProvider> {

  bool isLogin = false;
  int currentIndex = 0;

  final pages = [ //⭕️❌🆗🆖😌😔
    PushNextPage("❌", Colors.yellowAccent),
    PushNextPage("🆖", Colors.redAccent),
    PushNextPage("😔", Colors.green),
  ];

  final items = [
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "甲"),
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "乙"),
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "丙"),
  ];

  final keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
        onTap: (idx){
          if (idx == currentIndex) {
            print("hey");
//            firstTabNavKey.currentState.popUntil((route) => route.isFirst);
            keys[currentIndex].currentState.popUntil((route) => route.isFirst);
          }
          currentIndex = idx;
        },
      ),
      tabBuilder: (ctx, idx){

        return CupertinoTabView(
          navigatorKey: keys[idx],
          builder: (BuildContext context) => CupertinoPageScaffold(
            child: pages[idx],
          ),
        );

        return CupertinoTabView(
          navigatorKey: keys[idx],
          builder: (BuildContext context) {
            return SafeArea(
              top: false,
              bottom: false,
              child: CupertinoApp(
                home: CupertinoPageScaffold(
                  child: pages[idx],
                ),
              ),
            );
          },
        );

//        return CupertinoPageScaffold(
//          navigationBar: CupertinoNavigationBar(
//            middle: Text("庫比蒂諾"),
//          ),
////          child: CenterMessageWidget("cup", Colors.white)
//          child: pages[idx],
//        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("第十九堂課"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items,
        onTap: (idx) {
          setState(() {
            currentIndex = idx;
          });
        },
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 16),
                child: Icon(IcoFontIcons.waiterAlt, size: 100),
              ),
              ListTile(
                title: Text(isLogin ? "登出" : "登入",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                trailing: Switch(
                  value: isLogin,
                  onChanged: (isOn) {
                    setState(() {
                      isLogin = isOn;
                    });
                  },
                )
              )
            ]
          )
        )
      )
    );
  }
}

class PushNextPage extends StatelessWidget {

  String centerMessage = "";
  Color backgroundColor = Colors.white;

  PushNextPage(this.centerMessage, this.backgroundColor);

  @override
  Widget build(BuildContext context) {

    Widget nextPage = PopPreviousPage();

    final center = Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child:
        CupertinoButton(
          child: Icon(Icons.next_week),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => nextPage)
            );
          },
        )
//        IconButton(
//          icon: Icon(Icons.next_week),
//          onPressed: (){
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => nextPage)
//            );
//          },
//        )
    );

//    return CupertinoTabView(
//      builder: (ctx) => center,
//    );
    return center;
  }
}

class PopPreviousPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("若登出就返回"),
//        ),
//        body: Container()
//    );
    return CupertinoPageScaffold(
      child: Container()
    );
  }
}