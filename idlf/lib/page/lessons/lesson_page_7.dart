import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPage7 extends StatelessWidget {

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第七堂課"),
        ),
        body:SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: RaisedButton(
                    child: Text("iOS DatePicker"),
                    onPressed: (){}),
              ),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                    child: Text("Android TimePicker"),
                    onPressed: (){}),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: RaisedButton(
                    child: Text("ActionSheet"),
                    onPressed: (){}),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                    child: Text("BottomSheet"),
                    onPressed: (){}),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("你選擇的是")
              ),
            ],
          )
        )
    );
  }
}