import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_file_path_provider/flutter_file_path_provider.dart';
import 'package:idlf/page/bottom_navigation_page_2.dart';
import 'package:idlf/page/bottom_navigation_page_3.dart';
import 'package:idlf/counter_change_notifier.dart';
import 'package:idlf/page/home_page.dart';
import 'package:provider/provider.dart';

void main() {

  //這邊拿不到
//  FlutterFilePathProvider.instance.getHomeDirectory().then((result) {
//    print("路徑：${result.directory}");
//  });

//  debugPaintPointersEnabled = true;

  runApp(MarkApp());
//  runApp(MyApp());
//  runApp(BottomNavigationApp());
//  runApp(GridApp());
//  runApp(ProviderApp());
}

class MarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//    FlutterFilePathProvider.instance.getHomeDirectory().then((result) {
//      print("路徑：${result.directory}");
//    });

    return MaterialApp(
        home: HomePage()
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

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Provider step2 註冊廣播器
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(
          value: CounterChangeNotifier()
        )],
      child: BottomNavigationApp(),
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
