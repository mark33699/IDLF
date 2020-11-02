import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_10_listView_expansion.dart';
import 'package:idlf/page/lessons/lesson_page_10_listView_textField.dart';

class LessonPageListViewTextFieldAndExpansion extends StatelessWidget {

  final pages = [LessonPageListViewTextField(), LessonPageListViewExpansion()];
  final tabs = [Tab(text: "textField"), Tab(text: "expansion")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField & Expansion"),
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
