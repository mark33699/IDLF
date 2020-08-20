import 'package:flutter/material.dart';

class LessonPageDecoratedBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Center(child: LessonDecoratedBox())

        //終於方咖
//        Center(child: Container(color: Colors.brown, child: SizedBox(height: 100, width: 100, child: label)))
        /*滿咖區
        Container(color: Colors.brown, alignment: Alignment.center, child: SizedBox(height: 100, width: 100, child: label))
        Container(color: Colors.brown, alignment: Alignment.center, height: 100, width: 100, child: label)
        Container(color: Colors.brown, child: Center(child: SizedBox(height: 100, width: 100, child: label)))
        DecoratedBox(decoration: BoxDecoration(color: Colors.brown), child: Center(child: SizedBox(height: 100, width: 100, child: label)))
        */
    );
  }
}

class LessonDecoratedBox extends StatelessWidget {

//  final label = Text("123\n456\n789", textAlign: TextAlign.center);
  final label = Text("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
//      position: DecorationPosition.foreground, //裝飾層是墊在widget後, 還是檔在widget前, 預設為背景
      decoration: BoxDecoration(
        color: Colors.brown,
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(25), //切背景
        boxShadow: [BoxShadow(offset: Offset(3.0,3.0), blurRadius: 6.0)] //為何要指定多組陰影？
      ),
      child: ClipRRect( //切前景
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(height: 100, width: 100, child: label)
      )
    );
  }
}
