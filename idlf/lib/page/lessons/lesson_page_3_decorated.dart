import 'package:flutter/material.dart';

class LessonPageDecoratedBox extends StatelessWidget {

//  final label = Text("123\n456\n789", textAlign: TextAlign.center);
  final label = Text("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child:

        Center(child: Container(color: Colors.brown, child: SizedBox(height: 100, width: 100, child: label)))
//        Container(color: Colors.brown, alignment: Alignment.center, child: SizedBox(height: 100, width: 100, child: label))
//        Container(color: Colors.brown, alignment: Alignment.center, height: 100, width: 100, child: label)
//        Container(color: Colors.brown, child: Center(child: SizedBox(height: 100, width: 100, child: label)))
//        DecoratedBox(decoration: BoxDecoration(color: Colors.brown), child: Center(child: SizedBox(height: 100, width: 100, child: label)))
    );
  }
}

