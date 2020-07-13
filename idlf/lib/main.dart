import 'package:flutter/material.dart';

void main() {
  runApp(MarkApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = new TextEditingController();

    void pressed() {
      print(textEditingController.text);
    }

    var buttons = <Widget>[
      Image.asset(
        "resource/images/market.png",
        width: 50,
        height: 100,
        fit: BoxFit.none,
      ),
      Image.network(
          "https://img.alicdn.com/imgextra/i4/1033561790/TB2PfEQg17JL1JjSZFKXXc4KXXa_%21%211033561790.jpg"),
      FadeInImage(
          image: NetworkImage("https://img.alicdn.com/imgextra/i4/1033"),
          placeholder: AssetImage("resource/images/market.png")),
      IconButton(onPressed: pressed, icon: Icon(Icons.favorite)),
      TextField(controller: textEditingController, decoration: InputDecoration(hintText: "你有什麼秘密偷偷跟我說我不會告訴別人"),)
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
