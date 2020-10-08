import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

final maxLevel = 7;

class LessonPageNotification extends StatefulWidget {
  @override
  _LessonPageNotificationState createState() => _LessonPageNotificationState();
}

class _LessonPageNotificationState extends State<LessonPageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: PyramidWidget(1)
    );
  }
}

class PyramidWidget extends StatefulWidget {

  final int level;
  const PyramidWidget(this.level);

  @override
  _PyramidWidgetState createState() => _PyramidWidgetState();
}

class _PyramidWidgetState extends State<PyramidWidget> {

  final fireSecond = 1;
  final cubeLong = 25.0;
  bool showLevel = false;

  void fireAfter(int sec) {
    Future.delayed(Duration(seconds: sec)).then((value) {
      print("go");
      PyramidNotification(true).dispatch(context);
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.level);

    if (widget.level == maxLevel) {
      showLevel = true;
      print("me");

      fireAfter(fireSecond);
    }
  }

  @override
  Widget build(BuildContext context) {

    final levelText = Text(widget.level.toString(),
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );

    final pyramid = Container(
      width: cubeLong * (widget.level * 2 -1),
      height: cubeLong * (maxLevel + 1 - widget.level),
      color: rainbowColors[widget.level - 1],
      child: showLevel ? levelText : Container(),
    );

    final stack = Container(color: Color.fromRGBO(0, 0, 0, 0),
      child: Stack(alignment: Alignment.bottomCenter,
          children: [
            pyramid,
            widget.level == maxLevel ? Container() : PyramidWidget(widget.level + 1), //容器的部分
          ]
      ),
    );

    return NotificationListener<PyramidNotification>(
        onNotification: (notifi){
          print("come");
          if (notifi.ok) {
            fireAfter(fireSecond);
            setState(() {
              showLevel = true;
            });
          }
          return true; //是否到此為止, true: Stop; false: Bubbling
        },
        child: stack
    );
  }
}

class PyramidNotification extends Notification {
  final bool ok;
  PyramidNotification(this.ok);
}