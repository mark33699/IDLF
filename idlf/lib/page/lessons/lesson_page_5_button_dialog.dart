import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

class LessonPageButtonAndDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var currentPlatform = Theme.of(context).platform;
    if (currentPlatform == TargetPlatform.iOS) {
      print("我是iOS");
    } else {
      print("我不是iOS");
    }

    //先寫後面才能call
    showAlert(String message) {
      return showDialog( //原生方法
          context: context,
          builder: (BuildContext content) { //要用builder
            return ButtonAlertDialog(message);
          }
      );
    }

    //按鈕們放在build外面就拿不到context了...
    final raisedButton = RaisedButton(child: Text("RaisedButton"), onPressed: () async { //要用await必須用async包起來
      bool ans = await showAlert("RaisedButton");
      print("答案是 $ans");
    });
    final flatButton = FlatButton(child: Text("FlatButton"), onPressed: () async {
      bool ans = await showAlert("FlatButton");
      print("答案是 $ans");
    });
    final outlineButton = OutlineButton(child: Text("OutlineButton"), onPressed: () async {
      bool ans = await showAlert("OutlineButton");
      print("答案是 $ans");
    });
    final iconButton = IconButton(icon: Icon(Icons.ac_unit), onPressed: () async {
      bool ans = await showAlert("IconButton");
      print("答案是 $ans");
    });
    final cupertinoButton = CupertinoButton(child: Text("CupertinoButton"), onPressed: () async {
      bool ans = await showCupertinoDialog (
        context: context,
        builder: (BuildContext content) {
            return CupertinoButtonAlertDialog();
          }
      );
      print("答案是 $ans");
    });

    final raisedButtonDisable = RaisedButton(child: Text("RaisedButton"));
    final flatButtonDisable = FlatButton(child: Text("FlatButton"));
    final outlineButtonDisable = OutlineButton(child: Text("OutlineButton"));
    final iconButtonDisable = IconButton(icon: Icon(Icons.ac_unit));
    final cupertinoButtonDisable = CupertinoButton(child: Text("CupertinoButton"));

    return Scaffold(
        appBar: AppBar(
        title: Text("Button & Dialog"),
        ),
        body:ListView(
          itemExtent: 100,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //spaceEvenly是所有間距相等(如果要固定間隔就用SizedBox)
                children: [raisedButton, raisedButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [flatButton, flatButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [outlineButton, outlineButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [iconButton, iconButtonDisable]
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [cupertinoButton, cupertinoButtonDisable]
              )
            ),
          ],
        )
    );
  }
}

class ButtonAlertDialog extends StatelessWidget {

  final String message;
  ButtonAlertDialog(this.message); //init

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("你按的是"),
      content: Text(message),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, false); //要自己dismiss
          }),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context, true);
          }),
      ],
    );
  }
}

class CupertinoButtonAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("你按的是"),
      content: Text("iOS"),
      actions: <Widget>[
        CupertinoButton( //裝IconButton會壞掉XD
            child: Text("No~"),
            onPressed: () {
              Navigator.pop(context, false); //要自己dismiss
            }),
        CupertinoButton(
            child: Text("Yes!"),
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ]
    );
  }
}
