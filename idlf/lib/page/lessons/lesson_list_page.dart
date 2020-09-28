import 'package:flutter/material.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_11.dart';
import 'package:idlf/page/lessons/slidable_example.dart';
import 'lesson_page_1_routing.dart';
import 'lesson_page_2.dart';
import 'lesson_page_3.dart';
import 'lesson_page_4_text_field.dart';
import 'lesson_page_5_button_dialog.dart';
import 'lesson_page_6.dart';
import 'lesson_page_7_selector.dart';
import 'lesson_page_8.dart';
import 'lesson_page_9.dart';
import 'lesson_page_10.dart';

class LessonListPage extends StatelessWidget {

  final List<Lesson> lessons = [
    Lesson(Icon(Icons.mail_outline), 1, "跳轉", LessonPageRouting(showWording: "Hello World")),
    Lesson(Icon(Icons.inbox), 2, "佈局", LessonPageLayout()),
    Lesson(Icon(Icons.not_listed_location), 3, "容器", LessonPageChild()),
    Lesson(Icon(Icons.print), 4, "文字與輸入", LessonPageTextAndField()),
    Lesson(Icon(Icons.warning), 5, "按鈕與提示", LessonPageButtonAndDialog()),
    Lesson(Icon(Icons.image), 6, "圖片", LessonPageImage()),
    Lesson(Icon(Icons.call_split), 7, "選擇器", LessonPageSelector()),
    Lesson(Icon(Icons.message), 8, "列表", LessonPageListViewChildrenAndBuilder()),
    Lesson(Icon(Icons.format_list_numbered), 9, "又是列表", LessonPageListViewHeaderAndRefresh()),
    Lesson(Icon(Icons.format_list_bulleted), 10, "還是～列表", LessonPageListViewTextFieldAndExpansion()),
    Lesson(Icon(Icons.playlist_add_check), 11, "裁判～可以讓人列完又列這樣的嗎？", LessonPageListViewCheckBoxAndSwipe()),
    Lesson(Icon(Icons.playlist_add_check), 99, "側滑範例", SliableExamplePage(title: "側滑官方範例")),
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
