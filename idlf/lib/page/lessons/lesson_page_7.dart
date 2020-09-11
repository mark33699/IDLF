import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPage7 extends StatefulWidget {
  @override
  _LessonPage7State createState() => _LessonPage7State();
}

class _LessonPage7State extends State<LessonPage7> {

  double bottomWidgetHeight = 200;
  String choosed = "你選擇的是";
  Widget selector;

//  Widget datePicker = CupertinoDatePicker(
//      onDateTimeChanged: (date) {
//        setState(() { //“Only static members can be accessed in initializers”
//          print("datepicker");
//        });
//      }
//  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第七堂課"),
        ),
        body:SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: RaisedButton(
                            child: Text("iOS DatePicker"),
                            onPressed: (){
                              setState(() {
                                bottomWidgetHeight = (bottomWidgetHeight == 200) ? 0.01 : 200;
                                selector = CupertinoDatePicker(
                                  onDateTimeChanged: (date) {
                                    setState(() {
                                      choosed = "$date";
                                    });
                                  }
                                );
                              });
                            }),
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
                            child: Text(choosed)
                        ),
                      ],
                    )
                ),
                SizedBox( //好像Column裡不能用 FractionallySizedBox
                  height: bottomWidgetHeight,
                  child: Container(
                    color: Colors.greenAccent,
                    child: selector,
                  ),
                )
              ],
            )
        )
    );
  }
}