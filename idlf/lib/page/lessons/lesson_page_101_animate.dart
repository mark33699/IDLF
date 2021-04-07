import 'package:flutter/material.dart';

class LessonPageAnimate extends StatefulWidget {
  @override
  _LessonPageAnimateState createState() => _LessonPageAnimateState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _LessonPageAnimateState extends State<LessonPageAnimate>  with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation) //用animation生動畫, 而不是用controller
      ..addListener(() { //兩個點代表忽略, 實際assign的是animate, 不是addListener的結果
        setState(()=>{});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animate"),
        ),
        body: Center(
          child: Image.asset("resource/images/fantasy_unicorn.jpg",
              width: animation.value,
              height: animation.value
          ),
        )
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}