import 'package:flutter/material.dart';

class LessonPageExpanded extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: RedBorderGrayScale()
      ),
    );
  }
}

class RedBorderGrayScale extends StatelessWidget {

  final grayScales = [
//    Colors.white, //純色就會遮住邊線, 這什麼鬼現象...
    Colors.black12,
    Colors.black26,
    Colors.grey,
    Colors.black45
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 3)
      ),

      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(grayScales.length, (index) =>
              Expanded(
                  flex: index + 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(color: grayScales[index], child: null, height: 200),
                  )
              )
          )
      ),
    );
  }
}
