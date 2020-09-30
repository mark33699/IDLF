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
  final List<bool> wwwResult = [null, false, true];
  
  Widget _createContainer(String text) {
    return Container(
      height: long,
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  Widget _createResultWidget(bool result) {

    //⭕️❌
    if (result == true) {
      return _createContainer("🆗");
    } else if (result == false) {
      return _createContainer("🆖");
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
              _createContainer("form-data"),
              _createResultWidget(formDataResults[0]),
              _createResultWidget(formDataResults[1]),
              _createResultWidget(formDataResults[2]),
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
              _createContainer("x-www-form-urlencoded"),
              _createResultWidget(wwwResult[0]),
              _createResultWidget(wwwResult[1]),
              _createResultWidget(wwwResult[2]),
            ]
        )
      ]
    );
  }

  @override
  void initState() {
    super.initState();

    APIManager().loginHttpClientWWW(() {
      setState(() { wwwResult[0] = true; });
    }, () {
      setState(() { wwwResult[0] = false; });
    });

    APIManager().loginHttpWWW(() {
      setState(() { wwwResult[1] = true; });
    }, () {
      setState(() { wwwResult[1] = false; });
    });

    APIManager().loginDioWWW(() {
      setState(() { wwwResult[2] = true; });
    }, () {
      setState(() { wwwResult[2] = false; });
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