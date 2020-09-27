import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../define.dart';

class LessonPageListViewPinnedHeader extends StatelessWidget {

  final List<List<String>> stairs = List.generate(rainbowColors.length, (index) {
    return List.generate(index + 1, (index) {
      return "";
    });
  });

  @override
  Widget build(BuildContext context) {

//    return ListView(children: <Widget>[ListView(children: <Widget>[ListTile(title: Text("XXX"))])]);

    //真正的無限列表XD
//    return ListView.builder(
//      itemBuilder: (context, index) {
//        return StickyHeader(
//          header: Container(
//            height: 50.0,
//            color: Colors.blueGrey[700],
//            padding: EdgeInsets.symmetric(horizontal: 16.0),
//            alignment: Alignment.centerLeft,
//            child: Text('Header #$index',
//              style: const TextStyle(color: Colors.white),
//            ),
//          ),
//          content: Container(
//            child: Image.asset("resource/images/fantasy_unicorn.jpg", fit: BoxFit.cover,
//                width: double.infinity, height: 200.0),
//          ),
//        );
//    });

    return ListView.builder(
      itemCount: stairs.length,
      itemBuilder: (ctx, section) {
        return StickyHeaderBuilder(
          builder: (ctx, amount) {
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text("Header $section"),
              ),
            );
          },
          content: Column(
            children: List.generate(stairs[section].length, (row) {
              return Container(
                color: rainbowColors[row],
                child: ListTile(
                  title: Text("Cell $row"),
                )
              );
            })
          )
        );
      }
    );
  }
}
