import 'package:flutter/material.dart';

class LessonPageBasis extends StatelessWidget {

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView(
            controller: scrollController,
            children: <Widget>[
              Image.asset("resource/images/angry_unicorn.png"),
              Image.asset("resource/images/apple_bad_guy.gif"),
              Image.network("https://zh.wikipedia.org/static/images/project-logos/zhwiki-2x.png")
            ]
        )
    );
  }
}
