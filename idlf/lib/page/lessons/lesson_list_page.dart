import 'package:flutter/material.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_10.dart';
import 'lesson_page_1.dart';
import 'lesson_page_2.dart';
import 'lesson_page_3.dart';
import 'lesson_page_4.dart';
import 'lesson_page_5.dart';
import 'lesson_page_6.dart';
import 'lesson_page_7.dart';
import 'lesson_page_8.dart';
import 'lesson_page_9.dart';

class LessonListPage extends StatelessWidget {

  final List<Lesson> lessons = [
    Lesson(Icon(Icons.mail_outline), 1, "跳轉", LessonPage1(showWording: "Hello World")),
    Lesson(Icon(Icons.inbox), 2, "佈局", LessonPage2()),
    Lesson(Icon(Icons.not_listed_location), 3, "容器", LessonPage3()),
    Lesson(Icon(Icons.print), 4, "文字與輸入", LessonPage4()),
    Lesson(Icon(Icons.warning), 5, "按鈕與提示", LessonPage5()),
    Lesson(Icon(Icons.image), 6, "圖片", LessonPage6()),
    Lesson(Icon(Icons.call_split), 7, "選擇器", LessonPage7()),
    Lesson(Icon(Icons.message), 8, "列表", LessonPage8()),
    Lesson(Icon(Icons.transform), 9, "兩種tab bar", LessonPage9()),
    Lesson(Icon(Icons.account_box), 10, "API & model", LessonPage10()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I。D。L。F。"),
      ),
      body: ListView.builder(
        itemExtent: 50, //高度
        itemCount: lessons.length,
        itemBuilder: (context, index) {

          Lesson lesson = lessons[index];
          return ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 16),
              child: lesson.icon,
            ),
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
