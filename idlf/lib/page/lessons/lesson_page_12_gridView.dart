import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageGridView extends StatefulWidget {
  @override
  _LessonPageGridViewState createState() => _LessonPageGridViewState();
}

class _LessonPageGridViewState extends State<LessonPageGridView> {

//  final icons = List.generate(100, (index) => randomBrandIcon(color: randomColor()));
  final icons = List.generate(99, (index) => randomBrandIcon());

  @override
  Widget build(BuildContext context) {

    final space = 10.0;
    var items_number = 18 ;

    final gird = GridView.builder(
//      scrollDirection: Axis.horizontal,
        gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              mainAxisSpacing: space,
              crossAxisSpacing: space,
              childAspectRatio: 2 //寬是高的幾倍
          ),
//          SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            mainAxisSpacing: space,
//            crossAxisSpacing: space,
//            childAspectRatio: 1
//          ),
//        itemCount: items_number,
        itemCount: icons.length,
        itemBuilder: (ctx, idx) {
          final colorIndex = idx % rainbowBlackWhiteColors().length;
          return Container(
//              color: rainbowBlackWhiteColors()[colorIndex],
              color: random9Color(),
              child: icons[idx]
          );
        }
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(space),
          child: gird
          //用了NotificationListenerc還是無法分頁滾動
//          NotificationListener<ScrollNotification>(
//            onNotification: (scrollNotification) {
//              if(scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
//                setState(() {
//                  items_number += 18 ;
//                });
//                return true;
//              }
//              return false;
//            },
//            child: gird
//          )
        )
    );
  }
}