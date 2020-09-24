import 'package:flutter/material.dart';

class LessonPageRouting extends StatelessWidget {

  String showWording;
  LessonPageRouting({Key k, this.showWording}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一堂課：頁面跳轉"),
      ),
      body: Center(
        child: Text("$showWording")
      ),
    );
  }
}
