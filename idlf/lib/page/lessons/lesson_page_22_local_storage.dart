import 'package:flutter/material.dart';

class LessonPageLocalStorage extends StatefulWidget {
  @override
  _LessonPageLocalStorageState createState() => _LessonPageLocalStorageState();
}

class _LessonPageLocalStorageState extends State<LessonPageLocalStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Local Storage"),
        ),
        body: Container()
    );
  }
}