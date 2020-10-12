import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

import '../../define.dart';

class LessonPageTurtle extends StatefulWidget {
  @override
  _LessonPageTurtleState createState() => _LessonPageTurtleState();
}

class _LessonPageTurtleState extends State<LessonPageTurtle> {
  @override
  Widget build(BuildContext context) {

    //Color(0xff54c5f8) //淺藍
    //Color(0xff01579b) //深藍

    final shapeSum = 1;

    List<TurtleCommand> getShapeCommand(Color color) {
      return [
        PenDown(), //開始
        SetColor((_) => color),
        SetStrokeWidth((_) => 2),
        Repeat((_) => 1, [ //幾個圈
          Repeat((_) => 4, [ //線段數
            Forward((_) => 100.0), //走多遠
            Right((_) => 90) //轉幾度
          ]),
          Right((_) => 360 / shapeSum), //每圈隔幾度
        ]),
        PenUp(), //結束
      ];
    }

    List<TurtleCommand> turtleCommands = [];
    for (var index = 0;
        index < shapeSum;
        index ++) {

//      final c = rainbowColors[index % rainbowColors.length];
      final c = Color(0xff01579b);
      turtleCommands.addAll(getShapeCommand(c));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Turtle"),
        ),
        body: AnimatedTurtleView(
          animationDuration: Duration(seconds: 1),
          child: Container(
            width: double.infinity,
            height: 400,
          ),
          commands: turtleCommands,
        )
    );
  }
}
