import 'package:flutter/material.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double size = 77;

    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),),
          body: Center(
            child: Column(
              children: <Widget>[
                Text("W", style: TextStyle(fontSize: size)),
                Text("O", style: TextStyle(fontSize: size)),
                Text("R", style: TextStyle(fontSize: size)),
                Text("L", style: TextStyle(fontSize: size)),
                Text("D", style: TextStyle(fontSize: size)),],
              mainAxisAlignment: MainAxisAlignment.center,
            )))
    );
  }
}
