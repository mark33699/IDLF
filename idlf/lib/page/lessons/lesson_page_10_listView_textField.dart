import 'package:flutter/material.dart';

class LessonPageListViewTextField extends StatefulWidget {
  @override
  _LessonPageListViewTextFieldState createState() => _LessonPageListViewTextFieldState();
}

class _LessonPageListViewTextFieldState extends State<LessonPageListViewTextField> {

  final textFieldValues = List.generate(30, (index) => "");

  @override
  Widget build(BuildContext context) {

    //還是會跑掉
    /*
    return ListView(children: <Widget>[
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
      TextFieldTile("", "", null),
    ]);
    */

    return ListView.builder(
      itemCount: textFieldValues.length,
      itemBuilder: (ctx, idx) => TextFieldTile("${(idx + 1) * 2}", textFieldValues[idx], (text) {
        setState(() {
          textFieldValues[idx] = text;
        });
      }),
    );
  }
}

class TextFieldTile extends StatelessWidget {

  String title = "";
  String value = "";
  void Function(String) changeCallBack;
  TextFieldTile(this.title, this.value, this.changeCallBack);

  TextEditingController get fieldController => TextEditingController(text: value);

  @override
  Widget build(BuildContext context) {

    return Container(
        child:
        //不會重疊的寫法
        Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Text(title),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            width: 150,
            child: TextField(
              controller: fieldController,
              textAlign: TextAlign.right,
              onChanged: (text) {
                changeCallBack(text);
            }),
          )
        ])

      //要用Stack還是要配Positioned....
//          Stack(children: <Widget>[
//            Positioned(
//              child: Center(child: Text("${index + 1}")),
//              top: 0,
//              bottom: 0,
//              left: 8,
//            ),
//            Positioned(
//              child: TextField(),
//              top: 0,
//              right: 8,
//              width: 150,
//            )
//          ])
    );
  }
}
