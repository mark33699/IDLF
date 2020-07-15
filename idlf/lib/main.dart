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
  String yearOld = "";

  @override
  Widget build(BuildContext context) {

//    String yearOld = ""; //放這邊是不會刷新的喔

    TextEditingController textEditingController = new TextEditingController();

    //竟然要先定義才能call????
    void pushNextPage(BuildContext context) async {
      result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(
            currentString: textEditingController.text,)));

      setState((){});
    }

    Future<String> showAlert(BuildContext content) async {
      String answer = "";

      return showDialog(
          context: context,
          builder: (BuildContext content) {
            return AlertDialog(
              title: Text("彈窗"),
              content: Row( //用Center會有上下空白, 用Column會下方空很大一塊
                children: <Widget>[
                  Expanded(child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "請問今年貴庚",
                        hintText: "輸入框就是要輸入啊不然要幹嘛"
                    ),
                    onChanged: (value) {
                      answer = value;
                    },
                  ))
                ],
              ),
              actions: <Widget>[
                RaisedButton(
                    child: Text("好"),
                    onPressed: () {
                      Navigator.pop(context, answer);
                    }),
                RaisedButton(
                    child: Text("才不告訴你～勒～"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    }

    var widgets = <Widget>[
//      TextField(controller: textEditingController),
      OutlineButton(
          child: Text("要去了"),
          onPressed: () async {
//            pushNextPage(context);
             yearOld = await showAlert(context);
             setState(() {});
          }
      ),
//      Text("回禮是 $result")
      Text("您是$yearOld歲")
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