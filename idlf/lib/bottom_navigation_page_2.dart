import 'package:flutter/material.dart';
import 'package:idlf/tab_bar_page_1.dart';
import 'package:idlf/tab_bar_page_2.dart';
import 'package:idlf/tab_bar_page_3.dart';

class BottomNavigationPage2 extends StatelessWidget {

  final pages = [TabBarPage1(), TabBarPage2(), TabBarPage3()];
  final tabs = [Tab(text: "第2.1頁"), Tab(text: "第2.2頁"), Tab(text: "第2.3頁")];

  @override
  Widget build(BuildContext context) {

    //為了改tabBar的顏色
    return DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Container(
              child: TabBar(tabs: tabs),
              color: Colors.blueGrey,
            ),
            Expanded(child: TabBarView(
              children: pages,
            )),
          ],
        )
    );

    //直接把TabBar放到AppBar的位置
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: TabBar(
            tabs: tabs,
            labelColor: Colors.black54,
          ),
          body: TabBarView(
            children: pages,
          ),
        ));
  }
}
