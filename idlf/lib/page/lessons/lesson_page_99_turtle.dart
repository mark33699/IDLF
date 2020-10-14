import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

import '../../define.dart';

class LessonPageTurtle extends StatefulWidget {
  @override
  _LessonPageTurtleState createState() => _LessonPageTurtleState();
}

class _LessonPageTurtleState extends State<LessonPageTurtle> {

  Size turtleSize = Size.zero;

  @override
  Widget build(BuildContext context) {

    //Color(0xff54c5f8) //淺藍
    //Color(0xff01579b) //深藍

    final globalKey = GlobalKey();

    final shapeSum = 4;

    final waveHeight = 90; //浪高
    final waveWidth = 1.0; //浪幅

    final ovalCompression = 0.5; //需小於2, 不然會畫出奇妙的圖形喔XD, 越靠近1越像正圓

    final squareLength = 200.0;
    final squareSpinDegrees = 360 / shapeSum / 2;

    final starSpinDegrees = 360 / shapeSum;
    //固定重複4次
//    final starSpinDegrees = 90.0;
    //固定重複5次
//    final starSpinDegrees = 72.0;
//    final starSpinDegrees = 144.0;

    final defaultTriangleLength = turtleSize.width;
    double currentTriangleLength = defaultTriangleLength;

    List<TurtleCommand> getSierpinski(Color color) {
      return [

        SetColor((_) => color),
        SetStrokeWidth((_) => 2),
        GoTo((_) => Offset(-(defaultTriangleLength/2), defaultTriangleLength/3)),

        PenDown(), //開始
        Right((_) => 30), //創世角度
        Repeat((_) => 3, [
          Forward((_) => defaultTriangleLength),
          Right((_) => 120),
        ]),
      ];
    }

    List<TurtleCommand> getShapeCommand(Color color, int index) {

      //不知為何在這邊算會全部變成最後的長度, 難道是小烏龜內部實作的關係？
      //currentTriangleLength = currentTriangleLength / 2;

      //這樣寫就可以...final才會存進去？
      final long = currentTriangleLength / pow(2, index+1);

      return [

        SetColor((_) => color),

//        Log(currentTriangleLength.toString()), //Log印出來正常...

        Forward((_) => long),
        Right((_) => 60),

        Repeat((_) => 3, [
          Forward((_) => long),
          Right((_) => 120),
        ]),


      ];
    }

    List<TurtleCommand> turtleCommands = [];

    //「重複成圈」之前先轉向
//    turtleCommands.add( Right((_) => 32.5) );  //五瓣花
    turtleCommands.addAll(getSierpinski(Colors.black));

    for (var index = 0;
        index < shapeSum;
        index ++) {

      final c = rainbowColors[index % rainbowColors.length];
//      final c = Color(0xff01579b);
      turtleCommands.addAll(getShapeCommand(c, index));
    }
    print(turtleCommands.first.toString());

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final keyContext = globalKey.currentContext;
      print(keyContext);
      if (keyContext != null) {
        // widget is visible
        final box = keyContext.findRenderObject() as RenderBox;
        print(box.size);

        if (turtleSize == Size.zero){
          setState(() {
            turtleSize = box.size;
          });
        }
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Turtle"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              key: globalKey,
              color: Colors.black54,
              child: AnimatedTurtleView(
                animationDuration: Duration(seconds: 1),
                commands: turtleCommands,
                child: Container(),
              ),
            ),
            Container(
//              key: globalKey,
              width: 1,
              height: double.infinity,
              color: Colors.white,
            ),
            Container(
//              key: globalKey,
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