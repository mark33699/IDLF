import 'package:flutter/material.dart';

class LessonPageX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第X堂課"),
        ),
        body:Container()
    );
  }
}

class LessonPageY extends StatefulWidget {
  @override
  _LessonPage8State createState() => _LessonPage8State();
}

class _LessonPage8State extends State<LessonPageY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第八堂課"),
        ),
        body:Container()
    );
  }
}
