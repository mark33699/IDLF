import 'package:flutter/material.dart';

class LessonPageListViewTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textFieldListByChildren = ListView(
      children: List.generate(100, (index) {
        return TextFieldTile("${index + 1}");
      })
    );

    final textFieldListByBuilder = ListView.builder(
      itemCount: 100,
      itemBuilder: (ctx, idx) => TextFieldTile("${(idx + 1) * 2}"),
    );

//    return textFieldListByChildren;
    return textFieldListByBuilder;
  }
}

class TextFieldTile extends StatelessWidget {

  String title = "";
  TextFieldTile(this.title);

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
            child: TextField(),
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
