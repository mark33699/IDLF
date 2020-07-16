import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idlf/bottom_navigation_page_2.dart';
import 'package:idlf/bottom_navigation_page_3.dart';
import 'package:idlf/home_page.dart';

void main() {
//  runApp(MarkApp());
//  runApp(MyApp());
//  runApp(BottomNavigationApp());
  runApp(GridApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hello"),
            ),
            body: HomePage(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_call),
              elevation: 0.5,
              onPressed: () {
            print("沒事");
          }),
        )
    );
  }
}

//=================================================

class GridApp extends StatelessWidget {

  Random random = new Random();

  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
          children: List.generate(100, (index) =>
              Container(
                alignment: Alignment.center,
                  child: Text("$index"),
                  color: colors[random.nextInt(7)]
              )
          ),
        )
      )
    );
  }
}

//=================================================

class BottomNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: BottomNavigationPage(),
        ));
  }
}

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int currentIndex = 0;
  final pages = [HomePage(), BottomNavigationPage2(), BottomNavigationPage3()];
  final items = [BottomNavigationBarItem(title: Text("首頁"), icon: Icon(Icons.home)),
                 BottomNavigationBarItem(title: Text("第二頁"), icon: Icon(Icons.favorite)),
                 BottomNavigationBarItem(title: Text("第三頁"), icon: Icon(Icons.account_box)),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部導航"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          fixedColor: Colors.blue,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
        });
      }),
    );
  }
}
