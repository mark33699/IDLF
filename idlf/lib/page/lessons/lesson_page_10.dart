import 'package:flutter/material.dart';
import 'package:idlf/api.dart';
import 'package:idlf/model/User.dart';

class LessonPage10 extends StatefulWidget {
  @override
  _LessonPage10State createState() => _LessonPage10State();
}

class _LessonPage10State extends State<LessonPage10> {

  Users currentUsers;
  String errorMessage = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
//    APIManager().getUsers((users) {
//      setState(() {
//        currentUsers = users;
//      });
//    });
    APIManager().login(
//      "eve.holt@reqres.in",
//      "cityslicka", () {

        "0908969412",
        "121212", () {

        setState(() {
          errorMessage = "我成功了";
        });

    }, (e) {
        setState(() {
          errorMessage = e;
        });
    });
  }

  @override
  Widget build(BuildContext context) {

    var auth = Container(
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 200),
      child: Column(
        children: <Widget>[
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
              )
          ),
          SizedBox(height: 20),
          TextField(
              controller: pwdController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
              )
          ),
          SizedBox(height: 20),
          OutlineButton(
              child: Text("LOGIN"),
              onPressed: (){

          }),
          SizedBox(height: 20),
          Text(errorMessage,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );

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
        body: Center(child: auth) //(currentUsers == null) ? hud : list
    );
  }
}