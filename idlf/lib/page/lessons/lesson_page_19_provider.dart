import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

class LessonPageProvider extends StatefulWidget {
  @override
  _LessonPageProviderState createState() => _LessonPageProviderState();
}

class _LessonPageProviderState extends State<LessonPageProvider> {

  bool isLogin = false;
  int currentIndex = 0;

  final pages = [
    PushNextPage(Colors.orangeAccent, showAppBar: true),
    PushNextPage(Colors.black12),
    PushNextPage(Colors.brown),
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

    final tabScaffold = CupertinoTabScaffold(
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
                //加這個就會回不來...待研究
//              navigationBar: idx != 1 ? null : CupertinoNavigationBar(
//                middle: Text("庫比蒂諾"),
//              ),
            ),
        );
      },
    );

    return MultiProvider(
      child: tabScaffold,
      providers: [
        ChangeNotifierProvider.value(
          value: LoginChangeNotifier()
        )
      ],
    );
  }
}

//-

class PushNextPage extends StatefulWidget {

  Color backgroundColor = Colors.white;
  bool showAppBar;// = false; //這邊給預設值沒用...要寫在建構子

  PushNextPage(this.backgroundColor, {this.showAppBar = false});

  @override
  _PushNextPageState createState() => _PushNextPageState();
}

class _PushNextPageState extends State<PushNextPage> {

  bool isLogin = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    Widget nextPage = PopPreviousPage();

    final center = Container(
      color: widget.backgroundColor,
      alignment: Alignment.center,
      child: CupertinoButton(
        child: Icon(Icons.next_week, size: 30),
        onPressed: (){

          if (Provider.of<LoginChangeNotifier>(context).isLogin) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => nextPage)
            );
          } else {
            //大概是center這個widget先存起來了所以找不到吧...
            //Scaffold.of(context).showSnackBar( //Scaffold.of() called with a context that does not contain a Scaffold.
            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("只有登入後才可進入下一頁喔 :)")
              )
            );
          }

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

                //這句放在setState前面就會壞掉, 也太奇怪了吧....
                //Provider.of<LoginChangeNotifier>(context, listen: false).loginToggle();

                setState(() {
                  isLogin = isOn;
                });

                Provider.of<LoginChangeNotifier>(context, listen: false).loginToggle();
              },
            )
          )
        ],
      )
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: widget.showAppBar ? AppBar(title: Text("瑪提利尤")) : null,
      drawer: widget.showAppBar ? SizedBox(width: 200, child: drawer) : null,
      body: center,
    );
  }
}

//-

class PopPreviousPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //這樣寫是刷新整頁
//    Provider.of<LoginChangeNotifier>(context).onLogout = (){
//      Navigator.pop(context);
//    };

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Consumer<LoginChangeNotifier>( //用Consumer只刷新這邊
          child: Text("如果登出就會踢回前一頁"),
          builder: (context, LoginChangeNotifier loginModel, widget){
            loginModel.onLogout = () {
              Navigator.pop(context);
            };
            //這邊return出去的才是最後顯示的widget
            return Row(children: [
              widget, //這個widget就是上面的child, child可以保持不重刷
              Text(" :)")
            ], mainAxisAlignment: MainAxisAlignment.center);
          },
        )
      )
    );
  }
}

//-

class LoginChangeNotifier with ChangeNotifier { //這是原生的interface

  //dart可以getter/setter分開, 但  沒有private...
  //https://stackoverflow.com/questions/55756256/private-setters-in-dart
  //https://stackoverflow.com/questions/17488611/how-to-create-private-variables-in-dart/17488825
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  VoidCallback onLogin;
  VoidCallback onLogout;

  loginToggle() {
    _isLogin = !_isLogin;
    notifyListeners();
    if (isLogin) {
      onLogin();
    } else {
      onLogout();
    }
  }
}