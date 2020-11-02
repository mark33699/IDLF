import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_2_column.dart';
import 'package:idlf/page/lessons/lesson_page_2_row.dart';
import 'package:idlf/page/lessons/lesson_page_2_stack.dart';
import 'package:idlf/page/lessons/lesson_page_2_expanded.dart';

class LessonPageLayout extends StatelessWidget {

  final pages = [LessonPageColumn(), LessonPageRow(), LessonPageExpanded(), LessonPageStack()];
  final tabs = [Tab(text: "Column"), Tab(text: "Row"), Tab(text: "Expanded"), Tab(text: "Stack")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiChild"),
      ),
      body: DefaultTabController(
          length: tabs.length,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: TabBar(tabs: tabs),
              ),
              Expanded(child: TabBarView(children: pages))
            ],
          )
      ),
    );
  }
}
