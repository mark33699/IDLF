import 'package:flutter/material.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double size = 100;

    var widgets = <Widget>[
      FlutterLogo(size: 75,), //預設25
//    Expanded(child: Text("Ww", style: TextStyle(fontSize: size, backgroundColor: Colors.red))), //這樣也無法填滿= =
      Text("Ww", style: TextStyle(fontSize: size, backgroundColor: Colors.red)),
      Text("Oo", style: TextStyle(fontSize: size, backgroundColor: Colors.yellow)),
      Text("Rr", style: TextStyle(fontSize: size, backgroundColor: Colors.green)),
      Text("Ll", style: TextStyle(fontSize: size, backgroundColor: Colors.blue)),
      Text("Dd", style: TextStyle(fontSize: size, backgroundColor: Colors.purple)),];

    void pressed() {
      print("按！");
    }

    var buttons = <Widget>[
      RaisedButton(onPressed: pressed, child: Text("Raised")),
      FlatButton(onPressed: pressed, child: Text("Flat")),
      OutlineButton(onPressed: pressed, child: Text("Outline")),
//      IconButton(onPressed: null, icon: ,)),
    ];

    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),),
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
          ))
    );
  }
}
