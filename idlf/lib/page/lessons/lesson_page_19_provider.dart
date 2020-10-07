import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class LessonPageProvider extends StatefulWidget {
  @override
  _LessonPageProviderState createState() => _LessonPageProviderState();
}

class _LessonPageProviderState extends State<LessonPageProvider> {

  bool isLogin = false;
  int currentIndex = 0;

  final pages = [ //⭕️❌🆗🆖😌😔
    PushNextPage("❌", Colors.orangeAccent, showAppBar: true),
    PushNextPage("🆖", Colors.black12),
    PushNextPage("😔", Colors.brown),
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

  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
        onTap: (idx){
          if (idx == currentIndex) {
            keys[currentIndex].currentState.popUntil((route) => route.isFirst);
          }
          currentIndex = idx;
        },
      ),
      tabBuilder: (ctx, idx){

        return CupertinoTabView(
          navigatorKey: keys[idx],
          builder: (BuildContext context) =>
            CupertinoPageScaffold(
              child: pages[idx],
              navigationBar: idx != 1 ? null : CupertinoNavigationBar(
                middle: Text("庫比蒂諾"),
              ),
            ),
        );
      },
    );
  }
}

class PushNextPage extends StatefulWidget {

  String centerMessage = "";
  Color backgroundColor = Colors.white;
  bool showAppBar;// = false; //這邊給預設值沒用...要寫在建構子

  PushNextPage(this.centerMessage, this.backgroundColor, {this.showAppBar = false});

  @override
  _PushNextPageState createState() => _PushNextPageState();
}

class _PushNextPageState extends State<PushNextPage> {

  bool isLogin = false;

  @override
  Widget build(BuildContext context) {

    Widget nextPage = PopPreviousPage();

    final center = Container(
      color: widget.backgroundColor,
      alignment: Alignment.center,
      child:
      CupertinoButton(
        child: Icon(Icons.next_week, size: 30),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => nextPage)
          );
        },
      )
    );

    final drawer = Drawer(
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
        ],
      )
    );

    return Scaffold(
      appBar: widget.showAppBar ? AppBar(title: Text("瑪提利尤")) : null,
      drawer: widget.showAppBar ? SizedBox(width: 200, child: drawer) : null,
      body: center,
    );
  }
}

class PopPreviousPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("如果登出就會踢回前一頁"),
      )
    );
  }
}