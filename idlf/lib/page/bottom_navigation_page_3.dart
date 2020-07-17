import 'package:flutter/material.dart';
import 'package:idlf/counter_change_notifier.dart';
import 'package:provider/provider.dart';

class BottomNavigationPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown,
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Text("第三頁"),
            CounterConsumer()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Text("加"),
        onPressed: () {

          //Provider step3 發出廣播
          Provider.of<CounterChangeNotifier>(context,
              listen: false) //搞不太懂這個listen差在哪
              .increment();
        }
      ),
    );
  }
}

class CounterConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Provider step4 監聽廣播(可以做事)
    return Consumer<CounterChangeNotifier>(builder: (context, counter, _) {
      return Text("已經${counter.count}");
    });
  }
}
