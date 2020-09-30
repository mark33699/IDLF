import 'package:flutter/material.dart';

class LessonPageBottomNavigationAndTabBar extends StatefulWidget {
  @override
  _LessonPageBottomNavigationAndTabBarState createState() => _LessonPageBottomNavigationAndTabBarState();
}

class _LessonPageBottomNavigationAndTabBarState extends State<LessonPageBottomNavigationAndTabBar> {

  int currentIndex = 1;
  final pages = [
    CenterMessagePage("首頁", Colors.lightGreenAccent),
    LessonPageTabBar(),
    CenterMessagePage("第三頁", Colors.lightBlueAccent),
    CenterMessagePage("第四頁", Colors.grey),
    CenterMessagePage("第五頁", Colors.grey),
  ];
  final items = [
    BottomNavigationBarItem(title: Text("首頁"), icon: Icon(Icons.home), backgroundColor: Colors.red),
    BottomNavigationBarItem(title: Text("第二頁"), icon: Icon(Icons.star), backgroundColor: Colors.orange),
    BottomNavigationBarItem(title: Text("第三頁"), icon: Icon(Icons.account_box), backgroundColor: Colors.yellowAccent),
    BottomNavigationBarItem(title: Text("第四頁"), icon: Icon(Icons.local_airport), backgroundColor: Colors.blue),
    BottomNavigationBarItem(title: Text("第五頁"), icon: Icon(Icons.local_airport), backgroundColor: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第十四堂課"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: items,
          currentIndex: currentIndex,
          backgroundColor: Colors.pinkAccent,
          fixedColor: Colors.green,
          unselectedItemColor: Colors.deepPurpleAccent,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}


class LessonPageTabBar extends StatelessWidget {

  final pages = [
    CenterMessagePage("2.1頁", Colors.redAccent),
    CenterMessagePage("2.2頁", Colors.yellow),
    CenterMessagePage("2.3頁", Colors.pinkAccent),
  ];
  final tabs = [Tab(text: "第2.1頁"), Tab(text: "第2.2頁"), Tab(text: "第2.3頁")];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        initialIndex: 1,
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Container(
              child: TabBar(tabs: tabs, indicatorWeight: 5),
              color: Colors.lightGreen,
            ),
            Expanded(
              child: TabBarView(
                children: pages
              )
            )
          ],
        )
    );
  }
}

class CenterMessagePage extends StatelessWidget {

  String centerMessage = "";
  Color backgroundColor = Colors.white;

  CenterMessagePage(this.centerMessage, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Text(centerMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 100
        ),
      ),
    );
  }
}
