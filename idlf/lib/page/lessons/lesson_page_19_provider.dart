import 'package:flutter/material.dart';
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
    CenterMessagePage("❌", Colors.yellowAccent),
    CenterMessagePage("🆖", Colors.redAccent),
    CenterMessagePage("😔", Colors.green),
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