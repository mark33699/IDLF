import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下一頁"),
      ),
      body: Center(
        child: FlatButton(
            child: Text("回去吧"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
