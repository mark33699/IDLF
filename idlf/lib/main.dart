import 'package:flutter/material.dart';
import 'package:idlf/next_page.dart';

void main() {
  runApp(MarkApp());
//  runApp(MyApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hello"),
            ),
            body: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var result = "";

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = new TextEditingController();

    //竟然要先定義才能call????
    void pushNextPage(BuildContext context) async {
      result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(
            currentString: textEditingController.text,)));

      setState((){});
    }

    var widgets = <Widget>[
      TextField(controller: textEditingController),
      OutlineButton(
          child: Text("要去了"),
          onPressed: () {
            pushNextPage(context);
          }
      ),
      Text("回禮是 $result")
    ];

    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(30),
      child: ListView(
        children: widgets,
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.stretch, //雖然是填滿, 但卻填不滿= =
      ),
    );
  }
}