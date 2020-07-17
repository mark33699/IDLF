import 'package:flutter/material.dart';
import 'package:idlf/counter_change_notifier.dart';
import 'package:provider/provider.dart';

class TabBarPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        Text("第2.1頁"),

        //Provider step5 或是直接取值(類似singleton)
        Text("${ Provider.of<CounterChangeNotifier>(context).count }")
      ],
        mainAxisAlignment: MainAxisAlignment.center,)
    );
  }
}
