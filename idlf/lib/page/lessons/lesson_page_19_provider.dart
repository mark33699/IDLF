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
  int pageIdx = 0;

  final pages = [ //⭕️❌🆗🆖😌😔
    PushNextWidget("❌", Colors.yellowAccent),
    PushNextWidget("🆖", Colors.redAccent),
    PushNextWidget("😔", Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第十九堂課"),
      ),
      body: pages[pageIdx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "甲"),
          BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "乙"),
          BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "丙"),
        ],
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
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

class PushNextWidget extends StatelessWidget {

  String centerMessage = "";
  Color backgroundColor = Colors.white;

  PushNextWidget(this.centerMessage, this.backgroundColor);

  @override
  Widget build(BuildContext context) {

    Widget nextPage = PopPreviousPage();

    final center = Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(Icons.next_week),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => nextPage)
            );
          },
        )
    );

    return center;
  }
}

class PopPreviousPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("若登出就返回"),
        ),
        body: Container()
    );
  }
}