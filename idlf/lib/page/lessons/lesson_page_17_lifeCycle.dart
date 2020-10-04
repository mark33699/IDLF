import 'package:flutter/material.dart';
import 'package:idlf/page/lessons/scaffold_template.dart';

class LessonPageLifeCycle extends StatefulWidget {
  @override
  _LessonPageLifeCycleState createState() => _LessonPageLifeCycleState();
}

class _LessonPageLifeCycleState extends State<LessonPageLifeCycle> with WidgetsBindingObserver {

  bool gone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("A1. widget initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("A2. widget didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("A3. widget build");
    return Scaffold(
        appBar: AppBar(
          title: Text("第十七堂課"),
        ),
        body: Center(
            child: IconButton(
                icon: Icon(gone ? Icons.arrow_back : Icons.arrow_forward),
                onPressed: (){
                  setState(() {
                    gone = true;
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LessonPageX()));
                })
        )
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print("D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("Z2. widget dispose");
  }

  @override
  void didUpdateWidget(LessonPageLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("widget didUpdateWidget");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print(state);

    if (state == AppLifecycleState.resumed) {
      showDialog(
          builder: (context) => PasswordAlertDialog(),
          context: context,
          barrierDismissible: false
      );
    }
  }
}

class PasswordAlertDialog extends StatefulWidget {
  @override
  _PasswordAlertDialogState createState() => _PasswordAlertDialogState();
}

class _PasswordAlertDialogState extends State<PasswordAlertDialog> {

  String pwd = "";
  bool isError = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("身份驗證"),
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "請輸入密碼",
                    errorText: isError ? "密碼錯誤" : null
                ),
                onChanged: (value) {
                  pwd = value;
                  setState(() {
                    isError = false;
                  });
                },
              )
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (pwd == "IDLF") {
                Navigator.pop(context, true);
              } else {
                setState(() {
                  _textEditingController.text = "";
                  isError = true;
                });
              }
            }),
      ],
    );
  }
}