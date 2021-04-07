import 'package:flutter/material.dart';

class LessonPageTouchAndGesture extends StatefulWidget {
  @override
  _LessonPageTouchAndGestureState createState() =>
      _LessonPageTouchAndGestureState();
}

class _LessonPageTouchAndGestureState extends State<LessonPageTouchAndGesture> {
  final pages = [LessonPageTouch(), LessonPageGesture()];
  final tabs = [Tab(text: "觸摸行為"), Tab(text: "手勢拖曳")];

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
              //behavior: currentBehavior, //改這邊也無效
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

//GestureGestureGestureGestureGestureGestureGestureGestureGestureGestureGesture

class LessonPageGesture extends StatefulWidget {
  @override
  _LessonPageGestureState createState() => _LessonPageGestureState();
}

class _LessonPageGestureState extends State<LessonPageGesture> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
//          left: _left, //不更新left就代表限制垂直滑動
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
//                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），常见的效果是根据用户抬起手指时的速度做一个减速动画。
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}
