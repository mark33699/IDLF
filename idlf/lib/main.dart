import 'package:flutter/material.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double size = 50;

    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),),
          body: Container(
            color: Colors.amber,
            alignment: Alignment.center,
            margin: EdgeInsets.all(40),
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                FlutterLogo(size: 75,), //預設25
//                Expanded(child: Text("Ww", style: TextStyle(fontSize: size, backgroundColor: Colors.red))), //這樣也無法填滿= =
                Text("Ww", style: TextStyle(fontSize: size, backgroundColor: Colors.red)),
                Text("Oo", style: TextStyle(fontSize: size, backgroundColor: Colors.yellow)),
                Text("Rr", style: TextStyle(fontSize: size, backgroundColor: Colors.green)),
                Text("Ll", style: TextStyle(fontSize: size, backgroundColor: Colors.blue)),
                Text("Dd", style: TextStyle(fontSize: size, backgroundColor: Colors.purple)),],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, //雖然是填滿, 但卻填不滿= =
            ),
          ))
    );
  }
}
