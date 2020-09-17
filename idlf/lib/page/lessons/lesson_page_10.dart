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

    var hud = Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );

    var list = ListView.builder(
        itemExtent: 80,
        itemCount: (currentUsers == null) ? 0 : currentUsers.userList.length,
        itemBuilder: (ctx, idx) {

          var user = currentUsers.userList[idx];

          return Card(
              child: ListTile(
                leading: Container(
                  constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                  color: Colors.black38,
                  child: Image.network(user.avatar, fit: BoxFit.fill),
                ),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
              )
          );
        }
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("第十堂課"),
        ),
        body: (currentUsers == null) ? hud : list
    );
  }
}