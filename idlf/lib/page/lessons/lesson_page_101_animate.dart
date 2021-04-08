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
        duration: const Duration(seconds: 1), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation); //用animation生動畫, 而不是用controller
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animate"),
        ),
        body: GrowTransition(
          animation: animation,
          child: InkWell(
            child: Hero(
              tag: "mark",
              child: Image.asset("resource/images/fantasy_unicorn.jpg",)
            ),
            onTap: (){
              Navigator.push(context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                    return new FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("大图"),
                        ),
                        body: Hero(
                          tag: "mark", //唯一标记，前后两个路由页Hero的tag必须相同
                          child: Image.asset("resource/images/fantasy_unicorn.jpg", fit: BoxFit.none),
                        ),
                      ),
                    );
                  })
              );
            },
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

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            child: child,
            height: animation.value,
            width: animation.value,
          );
        }
      ),
    );
  }
}