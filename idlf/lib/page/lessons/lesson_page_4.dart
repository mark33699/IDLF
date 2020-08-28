import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LessonPage4 extends StatelessWidget {

  //宣告成變數好像就不能hot reload了...
  final normalText = Text("我就是一個樸實無華的text");
  final specialText = Text("我是一個置中/粗體/20 size/紅字的text",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red)
  );

  final pwdFocus = FocusNode();
  final mobileField = TextField(
      controller: null,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          hintText: "手機號碼"
      ),
      onChanged: (string) {
        print("手機是 $string");
      },
  );
  TextField get pwdField => TextField( //寫成getter才能取另外一個屬性
      controller: null,
      obscureText: true,
      focusNode: pwdFocus,
      decoration: InputDecoration(
          icon: Icon(Icons.vpn_key),
          hintText: "密碼"
      ),
      onChanged: (string) {
        print("密碼是 $string");
      }
  );

  @override
  Widget build(BuildContext context) {

    pwdFocus.addListener(() {
      print( "${pwdFocus.hasFocus ? "密碼開始輸入" : "密碼輸入完畢"}" );
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("第四堂課"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          itemExtent: 100,
          children: <Widget>[
            Container(
              color: Colors.greenAccent,
              child: normalText
            ),
            Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: specialText
            ),
            Container(
              color: Colors.greenAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: mobileField
            ),
            Container(
                color: Colors.blueAccent,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: pwdField
            ),
          ],
        )
    );
  }
}
