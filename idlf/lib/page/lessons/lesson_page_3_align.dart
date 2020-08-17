import 'package:flutter/material.dart';

class LessonPageAlign extends StatelessWidget {

  final aligns = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(aligns.length, (index) =>
          Container(
            color: Colors.black,
            child: Align(
              alignment: aligns[index],
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: FlutterLogo(),
              ),
            ),
          )
        ),
      ),
    );
  }
}
