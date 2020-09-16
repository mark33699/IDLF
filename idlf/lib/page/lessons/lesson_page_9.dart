import 'package:flutter/material.dart';

class LessonPage9 extends StatefulWidget {
  @override
  _LessonPage9State createState() => _LessonPage9State();
}

class _LessonPage9State extends State<LessonPage9> {

  int currentIndex = 1;
  final pages = [
    CenterMessagePage("首頁", Colors.lightGreenAccent),
    LessonPage9TabBar(),
    CenterMessagePage("第三頁", Colors.lightBlueAccent)
  ];
  final items = [
    BottomNavigationBarItem(title: Text("首頁"), icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text("第二頁"), icon: Icon(Icons.star)),
    BottomNavigationBarItem(title: Text("第三頁"), icon: Icon(Icons.account_box))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第九堂課"),
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


class LessonPage9TabBar extends StatelessWidget {

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
