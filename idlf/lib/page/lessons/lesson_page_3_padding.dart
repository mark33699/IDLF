import 'package:flutter/material.dart';

class LessonPagePadding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: Colors.blue,
                  child: null,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
