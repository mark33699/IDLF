import 'package:flutter/material.dart';

class LessonPagePushNotification extends StatefulWidget {
  @override
  _LessonPagePushNotificationState createState() => _LessonPagePushNotificationState();
}

class _LessonPagePushNotificationState extends State<LessonPagePushNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Push Notification"),
        ),
        body: Container()
    );
  }
}