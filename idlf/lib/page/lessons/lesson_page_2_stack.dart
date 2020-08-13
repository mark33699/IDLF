import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: List.generate(rainbowColors.length, (index) =>
          Positioned(
              left: 20 * index.toDouble(),
              top: 20 * index.toDouble(),
              child: Container(
                color: rainbowColors[index],
                child: null,
                width: 100,
                height: 100,
              )
          )
        )
      )
    );
  }
}
