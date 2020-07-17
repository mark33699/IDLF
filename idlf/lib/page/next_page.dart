import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {

  String currentString;
  NextPage({Key key, this.currentString}) : super(key: key);

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    var widgets = <Widget>[
      TextField(controller: textEditingController,
      decoration: InputDecoration(hintText: "傳來的是 $currentString"),),
      FlatButton(
          child: Text("回去吧"),
          onPressed: () {
            Navigator.pop(context, textEditingController.text);
          }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("下一頁"),
      ),
      body: ListView(children: widgets, padding: EdgeInsets.all(40),)
    );
  }
}
