import 'package:flutter/material.dart';
import 'package:idlf/push_nofitications.dart';

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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("不要在一進App就要求推播權限才是良好的體驗喔 :)"),
              OutlineButton(
                child: Text("點我要求推播權限"),
                onPressed: () {
                  PushNotificationsManager().init();
              })
            ],
          )
        )
    );
  }
}