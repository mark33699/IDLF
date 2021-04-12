import 'package:flutter/material.dart';
import 'package:idlf/L10N.dart';

class LessonPageL10n extends StatefulWidget {
  @override
  _LessonPageL10nState createState() => _LessonPageL10nState();
}

class _LessonPageL10nState extends State<LessonPageL10n> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10N.of(context).l10nTitle),
        ),
        body: Container()
    );
  }
}
