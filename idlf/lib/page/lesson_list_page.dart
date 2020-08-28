import 'package:flutter/material.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_1.dart';
import 'lessons/lesson_page_2.dart';
import 'lessons/lesson_page_3.dart';
import 'lessons/lesson_page_4.dart';
import 'lessons/lesson_page_5.dart';

class LessonListPage extends StatelessWidget {

  final List<Lesson> lessons = [
    Lesson(Icon(Icons.mail_outline), 1, "跳轉", LessonPage1()),
    Lesson(Icon(Icons.inbox), 2, "佈局", LessonPage2()),
    Lesson(Icon(Icons.not_listed_location), 3, "容器", LessonPage3()),
    Lesson(Icon(Icons.print), 4, "文字與輸入", LessonPage4()),
    Lesson(Icon(Icons.chat), 5, "按鈕與提示", LessonPage5()),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => lesson.page));
            },
          );
        },
      ),
    );
  }
}
