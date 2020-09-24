import 'package:flutter/material.dart';

class LessonPageImageBasis extends StatelessWidget {

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView(
            controller: scrollController,
            children: <Widget>[
//                FadeInImage.assetNetwork(
//                  placeholder: "resource/images/rainbowBall.jpg",
//                  image: "https://images7.alphacoders.com/110/1102158.png",
//                  height: 250,
//                  fit: BoxFit.fitHeight,
//                )

              Image(image: AssetImage("resource/images/ANGER_unicorn.png")),

//              Image.asset("resource/images/ANGER_unicorn.png"),
              Image.asset("resource/images/apple_bad_guy.gif"),
              Image.network("https://zh.wikipedia.org/static/images/project-logos/zhwiki-2x.png")
            ]
        )
    );
  }
}
