import 'package:flutter/material.dart';

class LessonPage8 extends StatefulWidget {
  @override
  _LessonPage8State createState() => _LessonPage8State();
}

class _LessonPage8State extends State<LessonPage8> {

  var messages = [//1,2,3];
    "歷史訊息",
    "歷史不能被遺忘",
    "歷史\n歷史\n歷史，\n很重要、說三次",
    """
    1
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
    樣對嗎？
    """,
    "❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤😂",
    "總算超過一頁了吧"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第八堂課"),
        ),
        body:ListView.builder(
          itemCount: messages.length,
          itemBuilder: (ctx, idx) {
            return MessageTile("${messages[idx]}");
            //return Image.asset("resource/images/bubble_outlined.png");
          }
        ),
        bottomSheet: TextField(
          decoration: InputDecoration(
            labelText: '有什麼話想說？',
            prefixIcon: Icon(Icons.message),
          ),
          onSubmitted: (text) {
            setState(() {
              messages.add(text);
            });
          },
        ),
    );
  }
}

class MessageTile extends StatelessWidget {

  String message;
  MessageTile(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(message,
        textAlign: TextAlign.right //應該是以最長的那句為準置左
      )
    );
  }
}
