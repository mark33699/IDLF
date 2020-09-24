import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/lesson_page_6_image_basis.dart';
import 'package:idlf/page/lessons/lesson_page_6_image_fit.dart';

class LessonPageImage extends StatelessWidget {

  final pages = [LessonPageImageBasis(), LessonPageImageFit()];
  final tabs = [Tab(text: "Basis"), Tab(text: "Fit")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第六堂課"),
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
