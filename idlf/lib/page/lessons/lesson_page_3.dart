import 'package:flutter/material.dart';
import 'lesson_page_3_align.dart';
import 'lesson_page_3_decorated.dart';
import 'lesson_page_3_padding.dart';

class LessonPageChild extends StatelessWidget {

  final pages = [LessonPageAlign(), LessonPagePadding(), LessonPageDecoratedBox()];
  final tabs = [Tab(text: "Align"), Tab(text: "Padding"), Tab(text: "DecoratedBox")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三堂課"),
      ),
      body: DefaultTabController(
          length: tabs.length,
          initialIndex: tabs.length - 1,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: FractionallySizedBox( //用這個包起來可以延伸但會置左
                    widthFactor: 1,
                    child: TabBar(
                        tabs: tabs,
                        isScrollable: true //可滾動會讓tab緊縮置中(不滾動就平均分佈, 如lesson2)
                    )
                )
              ),
              Expanded(child: TabBarView(children: pages))
            ],
          )
      ),
    );
  }
}
