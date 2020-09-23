import 'package:flutter/material.dart';

import 'lesson_page_8_listView_builder.dart';
import 'lesson_page_8_listView_children.dart';

class LessonPage8 extends StatelessWidget {

  final pages = [LessonPageChildren(), LessonPageBuilder()];
  final tabs = [Tab(text: "children"), Tab(text: "builder")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第八堂課"),
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
