import 'package:flutter/material.dart';
import 'lesson_page_3_align.dart';
import 'lesson_page_3_padding.dart';

class LessonPage3 extends StatelessWidget {

  final pages = [LessonPageAlign(), LessonPagePadding()];
  final tabs = [Tab(text: "Align"), Tab(text: "Padding")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三堂課"),
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
