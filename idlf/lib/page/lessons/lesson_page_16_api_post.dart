import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPageApiPost extends StatefulWidget {
  @override
  _LessonPageApiPostState createState() => _LessonPageApiPostState();
}

class _LessonPageApiPostState extends State<LessonPageApiPost> {

  final long = 66.0;
  
  Widget _createContainer(String text) {
    return Container(
      height: long,
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  Widget _createLoading() {
    return Container(
      height: long,
      child: CupertinoActivityIndicator()
    );
  }

  Widget _createTable() {

    return Table(

      columnWidths: {
        1: FixedColumnWidth(long),
        2: FixedColumnWidth(long),
        3: FixedColumnWidth(long),
      },

      children: [
        TableRow(
            children: [
              _createContainer(""),
              _createContainer("HttpClient"),
              _createContainer("http"),
              _createContainer("Dio"),
            ]
        ),

        TableRow(
            children: [
              _createContainer("form-data"),
              _createLoading(),
              _createLoading(),
              _createLoading(),
            ]
        ),

        TableRow(
            children: [
              _createContainer("json"),
              _createLoading(),
              _createLoading(),
              _createLoading(),
            ]
        ),

        TableRow(
            children: [
              _createContainer("x-www-form-urlencoded"),
              _createLoading(),
              _createLoading(),
              _createLoading(),
            ]
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第十六堂課"),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 8),
        child: _createTable()
      )
    );
  }
}














/*

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
    )
 */
