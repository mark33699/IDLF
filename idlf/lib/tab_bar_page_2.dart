import 'package:flutter/material.dart';
import 'package:idlf/counter_change_notifier.dart';
import 'package:provider/provider.dart';

class TabBarPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        Text("第2.2頁"),
        Text("${ Provider.of<CounterChangeNotifier>(context).count }")
      ],
      mainAxisAlignment: MainAxisAlignment.center,)
    );
  }
}
