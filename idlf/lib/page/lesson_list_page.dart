import 'package:flutter/material.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_1.dart';
import 'lessons/lesson_page_2.dart';

class LessonListPage extends StatelessWidget {

  final List<Lesson> lessons = [
    Lesson(Icon(Icons.mail_outline), 1, "頁面與跳轉", LessonPage1()),
    Lesson(Icon(Icons.print), 2, "文字與輸入", LessonPage1()),
    Lesson(Icon(Icons.beach_access), 3, "按鈕與提示", LessonPage1()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("[I][D][L][F]"),
      ),
      body: ListView.builder(
        itemExtent: 50, //高度
        itemCount: lessons.length,
        itemBuilder: (context, index) {

          Lesson lesson = lessons[index];
          return ListTile(
            leading: lesson.icon,
            title: Text("Lesson(${lesson.lessonNumber}) ${lesson.lessonName}"),
            onTap: () {
              LessonPage1 lesson = LessonPage1(showWording: "安安");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => lesson));
            },
          );
        },
      ),
    );
  }
}
