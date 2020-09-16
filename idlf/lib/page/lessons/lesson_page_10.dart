import 'package:flutter/material.dart';
import 'package:idlf/api.dart';
import 'package:idlf/model/User.dart';

class LessonPage10 extends StatefulWidget {
  @override
  _LessonPage10State createState() => _LessonPage10State();
}

class _LessonPage10State extends State<LessonPage10> {

  Users currentUsers;

  @override
  void initState() {
    super.initState();
    APIManager().getUsers((users) {
      setState(() {
        currentUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("第十堂課"),
        ),
        body: ListView.builder(
          itemExtent: 100,
          itemCount: (currentUsers == null) ? 0 : currentUsers.userList.length,
          itemBuilder: (ctx, idx) {
            return ListTile(title: Text(currentUsers.userList[idx].firstName));
          }
        )
    );
  }
}