import 'package:flutter/material.dart';

class LessonPageListViewChildren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var listLogo = Container(
      width: 40, //logo預設大小24, leading寬度40
      alignment: Alignment.center,
      child: FlutterLogo(),
    );

    var list = ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: listLogo,
          title: Text("Flutter ListTile Title (default)"),
          subtitle: Text("Flutter ListTile subTitle (default)"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

        ListTile(
          leading: listLogo,
          title: Text("Flutter ListTile Title (disable)"),
          subtitle: Text("Flutter ListTile subTitle (disable)"),
          trailing: Icon(Icons.arrow_forward_ios),
          enabled: false,
        ),


        ListTile(
          leading: listLogo,
          title: Text("Flutter ListTile Title (selected)"),
          subtitle: Text("Flutter ListTile subTitle (selected)"),
          trailing: Icon(Icons.arrow_forward_ios),
          selected: true,
        ),

        ListTile(
          leading: listLogo,
          title: Text("Flutter ListTile Title (dense)"),
          subtitle: Text("Flutter ListTile subTitle (dense)"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
      ],
    );

    return Container(
      color: Colors.green,
      child: Container(
        color: Colors.orange,
        child: list,
      ),
    );
  }
}