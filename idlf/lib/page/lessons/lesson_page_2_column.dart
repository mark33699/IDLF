import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageColumn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(rainbowColors.length, (index) =>
        Container(color: rainbowColors[index], child: null, width: 200, height: 50)
      )
    );
  }
}