import 'package:flutter/material.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_11.dart';
import 'package:idlf/page/lessons/lesson_page_12_gridView.dart';
import 'package:idlf/page/lessons/lesson_page_13_customScrollView.dart';
import 'lesson_page_14_bottomNavigation_tabBar.dart';
import 'lesson_page_15_api_get.dart';
import 'lesson_page_16_api_post.dart';
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

  List<Lesson> lessons = [
    Lesson(Icon(Icons.mail_outline), 1, "跳轉", LessonPageRouting(showWording: "Hello World")),
    Lesson(Icon(Icons.inbox), 2, "佈局", LessonPageLayout()),
    Lesson(Icon(Icons.not_listed_location), 3, "容器", LessonPageChild()),
    Lesson(Icon(Icons.print), 4, "文字與輸入", LessonPageTextAndField()),
    Lesson(Icon(Icons.warning), 5, "按鈕與提示", LessonPageButtonAndDialog()),
    Lesson(Icon(Icons.image), 6, "圖片", LessonPageImage()),
    Lesson(Icon(Icons.call_split), 7, "選擇器", LessonPageSelector()),
    Lesson(Icon(Icons.message), 8, "建立列表", LessonPageListViewChildrenAndBuilder()),
    Lesson(Icon(Icons.format_list_numbered), 9, "列表置頂與刷新", LessonPageListViewHeaderAndRefresh()),
    Lesson(Icon(Icons.format_list_bulleted), 10, "列表輸入與開合", LessonPageListViewTextFieldAndExpansion()),
    Lesson(Icon(Icons.playlist_add_check), 11, "列表多選與側滑", LessonPageListViewCheckBoxAndSwipe()),
    Lesson(Icon(Icons.grid_on), 12, "網格", LessonPageGridView()),
    Lesson(Icon(Icons.dashboard), 13, "特製滾動", LessonPageCustomScrollView()),
    Lesson(Icon(Icons.table_chart), 14, "底部導航與頁籤", LessonPageBottomNavigationAndTabBar()),
    Lesson(Icon(Icons.call_received), 15, "API GET", LessonPageApiGet()),
    Lesson(Icon(Icons.call_made), 16, "API POST", LessonPageApiPost()),
  ];

  @override
  Widget build(BuildContext context) {

    lessons = lessons.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("I。D。L。F"),
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
            title: Text("Lesson(${lesson.lessonNumber})"),
            trailing: Container(
//              padding: EdgeInsets.only(right: 16),
              width: 180,
              child: Text("${lesson.lessonName}"),
            ),
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
