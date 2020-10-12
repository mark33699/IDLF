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
    final ovalOffset = 0.4;

    List<TurtleCommand> getShapeCommand(Color color) {
      return [

          //方形
//        PenDown(), //開始
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//          Repeat((_) => 4, [ //線段數
//            Forward((_) => 100), //走多遠
//            Right((_) => 90) //轉幾度
//          ]),
//
//        Right((_) => 360 / shapeSum), //每圈隔幾度
//        PenUp(), //結束

          //圓形
//        Left((_) => 90),
//        Forward((_) => 57),
//        Right((_) => 90),
//        PenDown(), //開始
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        Repeat((_) => 360, [ //線段數
//          Forward((_) => 1), //走多遠
//          Right((_) => 1) //轉幾度
//        ]),
//        Right((_) => 360 / shapeSum), //每圈隔幾度
//        PenUp(), //結束

        //橢圓

        Left((_) => 90),
        Forward((_) => 39),
        Right((_) => 90),
        PenDown(), //開始
        SetColor((_) => color),
        SetStrokeWidth((_) => 2),


        //長一點 直一點
        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalOffset)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        //短一點 歪一點
        Repeat((_) => 60, [
          Forward((_) => 1),
          Right((_) => 2 - ovalOffset)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 60, [
          Forward((_) => 1),
          Right((_) => ovalOffset)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 60, [
          Forward((_) => 1),
          Right((_) => 2 - ovalOffset)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalOffset)
        ]),

        Right((_) => 360 / shapeSum), //每圈隔幾度
        PenUp(), //結束

          //五芒星
          //這三步往左平移
//        Left((_) => 90),
//        Forward((_) => 62),
//        Right((_) => 90),
//
//        PenDown(),
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        Right((_) => 18), //先稍微右偏再畫
//        Repeat((_) => 5, [Forward((_) => 200), Right((_) => 144)]),
//        PenUp(),

          //花瓣
//        PenDown(),
//        SetColor((_) => color),
//        Repeat((_) => 2, [ //半邊葉緣
//          Repeat((_) => 80, [
//                Forward((_) => 2.0),
//                Right((_) => 1.0)
//              ]),
//          Right((_) => 100)
//        ]),
//
//        Right((_) => 360 / shapeSum),
//        PenUp(),

      ];
    }

    List<TurtleCommand> turtleCommands = [];
    //大重複前轉向
//    turtleCommands.add( Right((_) => 32.5) );  //五瓣花
//    turtleCommands.add( Left((_) => 39.5) );  //單瓣花

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
        body: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedTurtleView(
              animationDuration: Duration(seconds: 1),
              commands: turtleCommands,
              child: Container(
                width: double.infinity,
              ),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: Colors.black,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
          ],
        )
    );
  }
}
