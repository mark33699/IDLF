import 'package:flutter/material.dart';

class LessonPageImageFit extends StatelessWidget {

  final fits = [
    BoxFit.contain,
    BoxFit.fitWidth,
    BoxFit.scaleDown,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.cover,
    BoxFit.none,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("resource/images/fantasy_unicorn.jpg"),
        Text("原始比例"),
        SizedBox(height: 10),
        Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: List.generate(fits.length, (index) =>
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: Image.asset("resource/images/fantasy_unicorn.jpg",
                              fit: fits[index]
                          )
                        )
                      ),
                      Text("${fits[index]}")
                    ],
                  )
              )
            )
        )
      ]
    );
  }
}
