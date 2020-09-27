import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_9_listView_stickyHeader.dart';
import 'package:idlf/page/lessons/lesson_page_9_listView_refresh.dart';

class LessonPageListViewHeaderAndRefresh extends StatelessWidget {

  final pages = [LessonPageListViewPinnedHeader(), LessonPageListViewRefresh()];
  final tabs = [Tab(text: "sticky header"), Tab(text: "refresh / load more")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第九堂課"),
      ),
      body: DefaultTabController(
          initialIndex: 0,
          length: tabs.length,
          child: Scaffold( //可以兩層Scaffold
              appBar: TabBar(tabs: tabs, labelColor: Colors.black54),
              body: TabBarView(children: pages))
      ),
    );
  }
}
