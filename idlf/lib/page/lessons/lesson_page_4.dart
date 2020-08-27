import 'package:flutter/material.dart';

class LessonPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第四堂課"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          itemExtent: 100,
          children: <Widget>[
            Container(
              color: Colors.greenAccent,
              child: Text("我就是一個樸實無華的text")
            ),
            Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text("我是一個置中/粗體/20 size/紅字的text",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
            )
          ],
        )
    );
  }
}
