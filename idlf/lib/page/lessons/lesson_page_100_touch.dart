import 'package:flutter/material.dart';

class LessonPageTouchAndGesture extends StatefulWidget {
  @override
  _LessonPageTouchAndGestureState createState() => _LessonPageTouchAndGestureState();
}

class _LessonPageTouchAndGestureState extends State<LessonPageTouchAndGesture> {

  final pages = [LessonPageTouch(), LessonPageTouch()];
  final tabs = [Tab(text: "觸摸"), Tab(text: "手勢")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Touch & Gesture"),
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

class LessonPageTouch extends StatefulWidget {
  @override
  _LessonPageTouchState createState() => _LessonPageTouchState();
}

class _LessonPageTouchState extends State<LessonPageTouch> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
