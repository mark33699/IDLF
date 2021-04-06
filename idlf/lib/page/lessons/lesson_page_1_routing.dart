import 'package:flutter/material.dart';

class LessonPageRouting extends StatelessWidget {

  String showWording;
  LessonPageRouting({Key k, this.showWording}) : super(key: k);

  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _editingController.text = "";

    if (showWording == null) {
      showWording = "你這不是從前一頁跳過來了嗎:)";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Routing"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            children: [
              Text("$showWording "),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextField(
                        controller: _editingController,
                        decoration: InputDecoration(
                          hintText: "請輸入想跟下一位說的話"
                        ),
                      ),
                    ),
                  ),

                  OutlineButton(
                    child: Text("去吧"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LessonPageRouting(showWording: _editingController.text)
                      ));
                    },
                  )
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
