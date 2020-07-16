import 'package:flutter/material.dart';
import 'package:idlf/tab_bar_page_1.dart';
import 'package:idlf/tab_bar_page_2.dart';
import 'package:idlf/tab_bar_page_3.dart';

class BottomNavigationPage2 extends StatelessWidget {

  final pages = [TabBarPage1(), TabBarPage2(), TabBarPage3()];
  final tabs = [Tab(text: "第2.1頁"), Tab(text: "第2.2頁"), Tab(text: "第2.3頁")];

  @override
  Widget build(BuildContext context) {

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
