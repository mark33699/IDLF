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

    final shapeSum = 8;

    final waveHeight = 90; //浪高
    final waveWidth = 1.0; //浪幅

    final ovalCompression = 0.5; //需小於2, 不然會畫出奇妙的圖形喔XD, 越靠近1越像正圓

    final squareLength = 200.0;
    final squareSpinDegrees = 360 / shapeSum / 2;

//    final starSpinDegrees = 360 / shapeSum / 5;
    //固定重複4次
    final starSpinDegrees = 90.0;
    //固定重複5次
//    final starSpinDegrees = 72.0;
//    final starSpinDegrees = 144.0;

        List<TurtleCommand> getShapeCommand(Color color, int index) {
      return [

        ///旋轉方塊
        SetColor((_) => color),
        SetStrokeWidth((_) => 2),

        Left((_) => 90),
        Forward((_) => 62),
        Left((_) => 90),
        Forward((_) => 72),
        ResetHeading(),

        Right((_) => index * starSpinDegrees), //偏移

        PenDown(), //開始

        Repeat((_) => 5, [
          Forward((_) => 200),
          Right((_) => 144)
        ]),

        PenUp(), //結束

        ResetPosition(),
        Right((_) => starSpinDegrees), //位移


      ];
    }

    List<TurtleCommand> turtleCommands = [];

    //「重複成圈」之前先轉向
//    turtleCommands.add( Right((_) => 32.5) );  //五瓣花

    for (var index = 0;
        index < shapeSum;
        index ++) {

      final c = rainbowColors[index % rainbowColors.length];
//      final c = Color(0xff01579b);
      turtleCommands.addAll(getShapeCommand(c, index));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Turtle"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black54,
              child: AnimatedTurtleView(
                animationDuration: Duration(seconds: 5),
                commands: turtleCommands,
                child: Container(
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: Colors.white,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
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

///橢圓
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        GoTo((_) => Offset(-42, 0)),
//        PenDown(),
//
//        //step3. 兩個半圓
//        Repeat((_) => 2, [
//
//          //step1. 往外畫
//          //長一點 直一點
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => ovalCompression)
//          ]),
//          //正常弧度
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => 1)
//          ]),
//          //短一點 歪一點
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => 2 - ovalCompression)
//          ]),
//
//          //step2. 往內畫
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => 2 - ovalCompression)
//          ]),
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => 1)
//          ]),
//          Repeat((_) => 30, [
//            Forward((_) => 1),
//            Right((_) => ovalCompression)
//          ]),
//
//        ]),
//
//        PenUp(), //結束

///五芒星
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//        GoTo((_) => Offset(-62, 72)), //這62怎麼來的我也不知道...
//        PenDown(),
//
//        Right((_) => 18), //先稍微右偏再畫
//        Repeat((_) => 5, [Forward((_) => 200), Right((_) => 144)]),
//
//        PenUp(),

///花瓣
//        SetColor((_) => color),
//        PenDown(),
//
//        Repeat((_) => 2, [ //半邊葉緣
//          Repeat((_) => 80, [
//                Forward((_) => 2.0),
//                Right((_) => 1.0)
//              ]),
//          Right((_) => 100)
//        ]),
//        Right((_) => 360 / shapeSum), //for「重複成圈」
//
//        PenUp(),

///旋轉方塊
//        SetColor((_) => color),
//        SetStrokeWidth((_) => 2),
//
//        Left((_) => 90),
//        Forward((_) => squareLength / 2),
//        Left((_) => 90),
//        Forward((_) => squareLength / 2),
//        ResetHeading(),
//        Right((_) => index * squareSpinDegrees), //偏移
//
//        PenDown(), //開始
//
//        Repeat((_) => 4, [
//          Forward((_) => squareLength),
//          Right((_) => 90)
//        ]),
//
//        PenUp(), //結束
//
//        ResetPosition(),
//        Right((_) => squareSpinDegrees), //位移