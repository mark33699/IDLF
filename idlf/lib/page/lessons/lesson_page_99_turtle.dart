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

    final waveHeight = 90; //浪高
    final waveWidth = 1.0; //浪幅

    final ovalCompression = 0.5; //需小於2, 不然會畫出奇妙的圖形XD //越靠近1越像正圓

    List<TurtleCommand> getShapeCommand(Color color) {
      return [

        //橢圓
//        GoTo((_) => Offset(-42, 0)),
        SetColor((_) => color),
        SetStrokeWidth((_) => 2),

        PenDown(), //開始





        //長一點 直一點
        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalCompression)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        //短一點 歪一點
        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 2 - ovalCompression)
        ]),

        //-

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 2 - ovalCompression)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalCompression)
        ]),

        //-

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalCompression)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 2 - ovalCompression)
        ]),

        //-

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 2 - ovalCompression)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => 1)
        ]),

        Repeat((_) => 30, [
          Forward((_) => 1),
          Right((_) => ovalCompression)
        ]),

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


///三角形
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        GoTo((_) => Offset(-50, 33)),
//
//        PenDown(), //開始
//
//        Right((_) => 30),
//        Forward((_) => 100),
//        Right((_) => 120),
//        Forward((_) => 100),
//        Right((_) => 120),
//        Forward((_) => 100),
//
//        PenUp(), //結束

///方形
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        GoTo((_) => Offset(-50, 50)),
//        PenDown(), //開始
//
//        Repeat((_) => 4, [
//          Forward((_) => 100),
//          Right((_) => 90)
//        ]),
//
//        PenUp(), //結束

///圓形
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        GoTo((_) => Offset(-57.5, 0)),
//        PenDown(), //開始
//
//        Repeat((_) => 360, [
//          Forward((_) => 1),
//          Right((_) => 1)
//        ]),
//
//        PenUp(), //結束

///波浪
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        Left((_) => waveHeight / 2), //初始角度須為浪高的一半, 才會筆直往上
//        PenDown(), //開始
//
//        //step3. 總共幾波
//        Repeat((_) => 3, [
//
//          //step1. 浪打過來～
//          Repeat((_) => waveHeight, [
//            Forward((_) => waveWidth),
//            Right((_) => 1) //往右偏其實是畫左浪
//          ]),
//
//          //step2. 浪打過去～
//          Repeat((_) => waveHeight, [
//            Forward((_) => waveWidth),
//            Left((_) => 1) //反方向
//          ]),
//        ]),
//
//        PenUp(), //結束