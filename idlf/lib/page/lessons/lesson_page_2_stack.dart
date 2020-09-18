import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.black,
      child: Container(
        color: Colors.white,
        constraints: BoxConstraints(minWidth: 333, minHeight: 333),
        child: Stack(
          overflow: Overflow.visible,

          children: List.generate(rainbowColors.length, (index) =>

            Container(
              color: rainbowColors[index],
              child: null,
              width: 300 / (index + 1).toDouble(),
              height: 300 / (index + 1).toDouble(),
            )

//            Positioned(
//                left: 20 * index.toDouble(),
//                top: 20 * index.toDouble(),
//                child: Container(
//                  color: rainbowColors[index],
//                  child: null,
//                  width: 100,
//                  height: 100,
//                )
//            )
          )
        )
      )
    );
  }
}
