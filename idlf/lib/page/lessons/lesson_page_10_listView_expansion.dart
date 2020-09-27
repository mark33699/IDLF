import 'package:flutter/material.dart';

class Group {
  final String title;
  final List<Group> subGroups;
  Group(this.title, this.subGroups);
}

class LessonPageListViewExpansion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final groups = [
      Group("軟體工程師", [
        Group("前端工程師", [
          Group("網頁工程師", [
            Group("React", []),
            Group("Vue", []),
            Group("Angular", []),
          ]),
          Group("手機工程師", [
            Group("iOS工程師", [
              Group("Swift", []),
              Group("Objective-C", []),
            ]),
            Group("Android工程師", [
              Group("Kotlin", []),
              Group("Java", []),
            ]),
            Group("跨平台工程師", [
              Group("Flutter", []),
              Group("React Native", []),
            ])
          ])
        ]),
        Group("後端工程師", [
          Group("Python", []),
          Group("C#", []),
          Group("Go", []),
          Group("Node.js", []),
          Group("PHP", []),
          Group("Java", []),
          Group("Ruby", []),
          Group("Rust", []),
        ]),
      ])
    ];

    Widget _getTile(Group group, double level) {

       final paddingText = Padding(
         padding: EdgeInsets.only(left: level * 16),
         child: Text(group.title),
       );

       if (group.subGroups.isEmpty) {
         print("${group.title} have no children");
         return ListTile(
           title: paddingText
         );
       } else {
         print("${group.title} have children");
         return ExpansionTile(
           key: PageStorageKey<Group>(group),
           title: paddingText,
           children: group.subGroups.map((element) => _getTile(element, level + 1)).toList(),
         );
       }
    }

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (ctx, idx) {
        final group = groups[idx];
        return _getTile(group, 0);
    });

  }
}
