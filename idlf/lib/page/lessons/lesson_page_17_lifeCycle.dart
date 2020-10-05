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
//    print("A1. widget initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    print("A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(LessonPageLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
//    print("A3. widget didUpdateWidget");
  }

  final TestUpdateWidget test1 = TestUpdateWidget();
  TestUpdateWidget test2 = TestUpdateWidget();
//  TestUpdateWidget test1 = TestUpdateWidget(key: GlobalKey());
//  TestUpdateWidget test2 = TestUpdateWidget(key: GlobalKey());

  @override
  Widget build(BuildContext context) {
    print("A4. widget build");
    return Scaffold(
        appBar: AppBar(
          title: Text("第十七堂課"),
        ),
        body: Column(
          children: [
            Center(
                child: IconButton(
                    icon: Icon(gone ? Icons.arrow_back : Icons.arrow_forward),
                    onPressed: (){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LessonPageX()));

                      setState(() {
//                        gone = false;
                        gone = true;
                      });
                    })
            ),
            gone ? test1 : test2
//            gone ? TestUpdateWidget() : TestUpdateWidget()
//            test1
//            TestUpdateWidget()
          ],
        )
    );
  }

  @override
  void reassemble() {
    super.reassemble();
//    print("D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
//    print("Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
//    print("Z2. widget dispose");
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

class TestUpdateWidget extends StatefulWidget {
  const TestUpdateWidget({
    Key key,
  });

  @override
  _TestUpdateWidgetState createState() => _TestUpdateWidgetState();
}

class _TestUpdateWidgetState extends State<TestUpdateWidget> {

  @override
  void initState() {
    super.initState();
    print("pls init me~~~ ${context.widget.hashCode}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    print("pls change me~~~");
  }

  @override
  void didUpdateWidget(covariant TestUpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("pls update me~~~ ${oldWidget.hashCode}");
  }

  @override
  void reassemble() {
//    print("pls reassemble me~~~");
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void deactivate() {
    super.deactivate();
//    print("pls deactivate me~~~");
  }

  @override
  void dispose() {
    super.dispose();
//    print("pls dispose me~~~");
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