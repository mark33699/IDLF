import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageGridView extends StatelessWidget {

//  final icons = List.generate(100, (index) => randomBrandIcon(color: randomColor()));
  final icons = List.generate(100, (index) => randomBrandIcon());

  @override
  Widget build(BuildContext context) {

    final space = 10.0;

    return Scaffold(
        appBar: AppBar(
          title: Text("第十二堂課"),
        ),
        body: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(space),
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              mainAxisSpacing: space,
              crossAxisSpacing: space,
              childAspectRatio: 2 //寬是高的幾倍
            ),
//              SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3,
//                mainAxisSpacing: space,
//                crossAxisSpacing: space,
//                childAspectRatio: 2
//              ),
            itemCount: icons.length,
            itemBuilder: (ctx, idx) {
              return Container(
                color: randomColor(),
                child: icons[idx]
              );
            }
          )
        )
    );
  }
}