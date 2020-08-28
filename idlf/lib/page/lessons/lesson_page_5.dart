import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPage5 extends StatelessWidget {

  final raisedButton = RaisedButton(child: Text("RaisedButton"), onPressed: () {});
  final flatButton = FlatButton(child: Text("FlatButton"), onPressed: () {});
  final outlineButton = OutlineButton(child: Text("OutlineButton"), onPressed: () {});
  final iconButton = IconButton(icon: Icon(Icons.ac_unit), onPressed: () {});
  final cupertinoButton = CupertinoButton(child: Text("CupertinoButton"), onPressed: () {});

  final raisedButtonDisable = RaisedButton(child: Text("RaisedButton"));
  final flatButtonDisable = FlatButton(child: Text("FlatButton"));
  final outlineButtonDisable = OutlineButton(child: Text("OutlineButton"));
  final iconButtonDisable = IconButton(icon: Icon(Icons.ac_unit));
  final cupertinoButtonDisable = CupertinoButton(child: Text("CupertinoButton"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("第五堂課"),
        ),
        body:ListView(
          itemExtent: 100,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //spaceEvenly是所有間距相等(如果要固定間隔就用SizedBox)
                children: [raisedButton, raisedButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [flatButton, flatButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [outlineButton, outlineButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [iconButton, iconButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [cupertinoButton, cupertinoButtonDisable]
              )
            ),
          ],
        )
    );
  }
}