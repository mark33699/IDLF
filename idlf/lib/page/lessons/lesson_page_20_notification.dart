import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

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
        body: PyramidWidget(7)
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

  final topLevel = 7;
  final cubeLong = 25.0;

  @override
  Widget build(BuildContext context) {

    final pyramid = Container(
      width: cubeLong * (widget.level * 2 -1),
      height: cubeLong * (topLevel + 1 - widget.level),
      color: rainbowColors[widget.level - 1],
      child: Text(widget.level.toString(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );

    return Container(color: Color.fromRGBO(0, 0, 0, 0),
        child: Stack(alignment: Alignment.bottomCenter,
          children: [
            widget.level == 1 ? Container() : PyramidWidget(widget.level - 1), //容器的部分
            pyramid,
          ]
        ),
    );
  }
}
