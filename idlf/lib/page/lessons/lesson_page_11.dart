import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_11_listView_checkbox.dart';
import 'package:idlf/page/lessons/lesson_page_11_listView_swipe.dart';

class LessonPageListViewCheckBoxAndSwipe extends StatelessWidget {

  final pages = [LessonPageListViewCheckbox(), LessonPageListViewSwipe()];
  final tabs = [Tab(text: "checkbox"), Tab(text: "swipe")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox & Swipe"),
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
