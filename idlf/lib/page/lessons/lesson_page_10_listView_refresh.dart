import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPageListViewRefresh extends StatefulWidget {
  @override
  _LessonPageListViewRefreshState createState() => _LessonPageListViewRefreshState();
}

class _LessonPageListViewRefreshState extends State<LessonPageListViewRefresh> {

  final pageSize = 5;
  int currentPage = 1;
  List<int> fibonacci = [];

  List<int> _createFib() {
    List<int> fib = [];
    print("Help~~~");
    for (var index = 0;
             index < pageSize;
             index ++) {
      if (index == 0 || index == 1) {
        if (fibonacci.isEmpty) {
          fib.add(index);
        } else if (index == 0) {
          fib.add(fibonacci[fibonacci.length - 2] + fibonacci.last);
        } else {
          fib.add(fibonacci.last + fib.first);
        }
      } else {
        fib.add(fib[index - 2] + fib[index - 1]);
      }
    }
    print(fib.toString());
    return fib;
  }

  @override
  void initState() {
    super.initState();
    fibonacci.addAll(_createFib());
  }

  @override
  Widget build(BuildContext context) {

    return
      RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currentPage ++;
            fibonacci.addAll(_createFib());
          });
        },
        child: ListView.builder(
          itemCount: fibonacci.length,
          itemBuilder: (ctx, idx) {
            return ListTile(title: Text("${idx + 1} : ${fibonacci[idx]}")
          );
        })
    );
  }
}