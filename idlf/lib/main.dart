import 'package:flutter/material.dart';
import 'package:idlf/next_page.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = new TextEditingController();

    var buttons = <Widget>[
      OutlineButton(
          child: Text("要去了"),
          onPressed: () {
            print("push");
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()));
          }
      )
    ];

    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hello"),
            ),
            body: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(30),
              child: ListView(
                children: buttons,
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.stretch, //雖然是填滿, 但卻填不滿= =
              ),
            )));
  }
}
