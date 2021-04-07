import 'package:flutter/material.dart';

class LessonPageTouchAndGesture extends StatefulWidget {
  @override
  _LessonPageTouchAndGestureState createState() =>
      _LessonPageTouchAndGestureState();
}

class _LessonPageTouchAndGestureState extends State<LessonPageTouchAndGesture> {
  final pages = [LessonPageTouch(), LessonPageTouch()];
  final tabs = [Tab(text: "觸摸行為"), Tab(text: "手勢")];

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
          )),
    );
  }
}

//TouchTouchTouchTouchTouchTouchTouchTouchTouchTouchTouchTouchTouchTouchTouch

class LessonPageTouch extends StatefulWidget {
  @override
  _LessonPageTouchState createState() => _LessonPageTouchState();
}

class _LessonPageTouchState extends State<LessonPageTouch> {
  String currentDown = "";
  HitTestBehavior currentBehavior = HitTestBehavior.deferToChild;
  final dropDownItems = [
    DropdownMenuItem(child: Text("deferToChild"), value: HitTestBehavior.deferToChild),
    DropdownMenuItem(child: Text("opaque"), value: HitTestBehavior.opaque),
    DropdownMenuItem(child: Text("translucent"), value: HitTestBehavior.translucent),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            hint: Text("行為模式：" + currentBehavior.toString().split(".").last),
            value: null, //這個value到底是幹嘛的...?
            items: dropDownItems,
            onChanged: (val) {
              setState(() {
                currentDown = "";
                currentBehavior = val;
                print(currentBehavior);
              });
            }),
        Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green)),
              ),
              onPointerDown: (event) => setState(() {
                currentDown = "outside\n" + currentDown;
              }),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(child: Text("左上角200*100范围内\n非文本区域点击")),
                ),
              ),
              onPointerDown: (event) => setState(() {
                currentDown = "inside\n" + currentDown;
              }),
              behavior: currentBehavior,
            )
          ],
        ),
        Expanded(child: SingleChildScrollView(child: Text(currentDown)))
      ],
    );
  }
}
