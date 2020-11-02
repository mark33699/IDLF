import 'package:flutter/material.dart';

import 'lesson_page_8_listView_builder.dart';
import 'lesson_page_8_listView_children.dart';

class LessonPageListViewChildrenAndBuilder extends StatelessWidget {

  final pages = [LessonPageListViewChildren(), LessonPageListViewBuilder()];
  final tabs = [Tab(text: "children"), Tab(text: "builder")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("use Children or Builder"),
      ),
      body: DefaultTabController(
        length: tabs.length,
        child: Scaffold( //可以兩層Scaffold
          appBar: TabBar(tabs: tabs, labelColor: Colors.black54),
          body: TabBarView(children: pages))
      ),
    );
  }
}
