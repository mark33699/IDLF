import 'package:flutter/material.dart';

class Lesson {
  final Icon icon;
  final int lessonNumber;
  final String lessonName;
  final Widget page;

  Lesson(this.icon, this.lessonNumber, this.lessonName, this.page);
}