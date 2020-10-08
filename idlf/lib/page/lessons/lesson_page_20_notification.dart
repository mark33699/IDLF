import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

final topLevel = 7;

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
        body: PyramidWidget(topLevel)
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

  final cubeLong = 25.0;
  bool showLevel = false;

  @override
  void initState() {
    super.initState();
    print(widget.level);

    if (widget.level == 1) {
      print("me");
      Future.delayed(Duration(seconds: 2)).then((value) {
        print("go");
        PyramidNotification(true).dispatch(context);
      });
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
      height: cubeLong * (topLevel + 1 - widget.level),
      color: rainbowColors[widget.level - 1],
      child: NotificationListener<PyramidNotification>(
        onNotification: (notifi){
          print("come");
          if (notifi.ok) {
            setState(() {
              showLevel = true;
            });
          }
          return true; //繼續向上傳遞
        },
        child: showLevel ? levelText : Container(),
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

class PyramidNotification extends Notification {
  final bool ok;
  PyramidNotification(this.ok);
}