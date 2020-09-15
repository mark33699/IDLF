import 'package:flutter/material.dart';

class LessonPage8 extends StatefulWidget {
  @override
  _LessonPage8State createState() => _LessonPage8State();
}

class _LessonPage8State extends State<LessonPage8> {

  final listViewController = ScrollController();

  var messages = [//1,2,3];
    "歷史訊息",
    "歷史不能被遺忘",
    "歷史\n歷史\n歷史，\n很重要、說三次",
    """1
2
3
4
5
6
7
8
我
叫
你
爸
、
你
打
我
媽
、
這
樣對嗎？""",
    "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤😂",
    "總算超過一頁了吧"
  ];

  @override
  Widget build(BuildContext context) {

    final list = ListView.builder(
        controller: listViewController,
        itemCount: messages.length,
        itemBuilder: (ctx, idx) {
          return MessageTile("${messages[idx]}");
        }
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("第八堂課"),
        ),
        body: Column(children: <Widget>[
          Expanded(child: list),
          TextField(
            decoration: InputDecoration(
              labelText: '有什麼話想說？',
              prefixIcon: Icon(Icons.message),
            ),
            onSubmitted: (text) {
              setState(() {
                messages.add(text);
                listViewController.jumpTo(listViewController.position.maxScrollExtent);
              });
            },
          )
        ]
      )
    );
  }
}

class MessageTile extends StatelessWidget {

  String message;
  MessageTile(this.message);

  @override
  Widget build(BuildContext context) {

    //return Image.asset("resource/images/bubble_outlined.png");
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200), //如何得到父組件的寬度？
        child: Text(message),
      )
    );
  }
}
