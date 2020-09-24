import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_9_listView_expansion.dart';
import 'package:idlf/page/lessons/lesson_page_9_listView_textField.dart';

class LessonPageListView extends StatelessWidget {

  final pages = [LessonPageListViewTextField(), LessonPageListViewExpansion()];
  final tabs = [Tab(text: "textField"), Tab(text: "expansion")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第九堂課"),
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
