import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../api.dart';

class LessonPageApiPost extends StatefulWidget {
  @override
  _LessonPageApiPostState createState() => _LessonPageApiPostState();
}

class _LessonPageApiPostState extends State<LessonPageApiPost> {

  final long = 66.0;
  final List<bool> formDataResults = [null, null, null];
  final List<bool> jsonResults = [null, null, null];
  final List<bool> wwwResults = [null, null, null];
  
  Widget _createContainer(String text) {
    return Container(
      height: long,
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  Widget _createResultWidget(bool result) {

    //⭕️❌🆗🆖
    if (result == true) {
      return _createContainer("⭕️");
    } else if (result == false) {
      return _createContainer("❌");
    } else {
      return Container(
          height: long,
          child: CupertinoActivityIndicator()
      );
    }
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
              _createContainer("json"),
              _createResultWidget(jsonResults[0]),
              _createResultWidget(jsonResults[1]),
              _createResultWidget(jsonResults[2]),
            ]
        ),

        TableRow(
            children: [
              _createContainer("form-data"),
              _createResultWidget(formDataResults[0]),
              _createResultWidget(formDataResults[1]),
              _createResultWidget(formDataResults[2]),
            ]
        ),

        TableRow(
            children: [
              _createContainer("x-www-form-urlencoded"),
              _createResultWidget(wwwResults[0]),
              _createResultWidget(wwwResults[1]),
              _createResultWidget(wwwResults[2]),
            ]
        )
      ]
    );
  }

  @override
  void initState() {
    super.initState();

    APIManager().loginHttpClientWWW(() {
      setState(() { wwwResults[0] = true; });
    }, () {
      setState(() { wwwResults[0] = false; });
    });

    APIManager().loginHttpWWW(() {
      setState(() { wwwResults[1] = true; });
    }, () {
      setState(() { wwwResults[1] = false; });
    });

    APIManager().loginDioWWW(() {
      setState(() { wwwResults[2] = true; });
    }, () {
      setState(() { wwwResults[2] = false; });
    });

    APIManager().loginHttpClientJson(() {
      setState(() { jsonResults[0] = true; });
    }, () {
      setState(() { jsonResults[0] = false; });
    });

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

class AuthBox extends StatelessWidget {

  String errorMessage = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}