import 'package:flutter/material.dart';
import 'package:idlf/define.dart';

class LessonPageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(rainbowColors.length, (index) =>
        Container(color: rainbowColors[index], child: null, width: 50, height: 200)
      )
    );
  }
}