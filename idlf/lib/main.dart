import 'package:flutter/material.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),),
          body: Center(
            child: Text("W\nO\nR\nL\nD"),))
    );
  }
}
