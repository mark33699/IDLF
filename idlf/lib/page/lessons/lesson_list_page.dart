import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:idlf/model/Lesson.dart';
import 'package:idlf/page/lessons/lesson_page_11.dart';
import 'package:idlf/page/lessons/lesson_page_12_gridView.dart';
import 'package:idlf/page/lessons/lesson_page_13_customScrollView.dart';
import 'package:idlf/page/lessons/lesson_page_14_bottomNavigation_tabBar.dart';
import 'package:idlf/page/lessons/lesson_page_15_api_get.dart';
import 'package:idlf/page/lessons/lesson_page_16_api_post.dart';
import 'package:idlf/page/lessons/lesson_page_17_lifeCycle.dart';
import 'package:idlf/page/lessons/lesson_page_18_inheritedWidget.dart';
import 'package:idlf/page/lessons/lesson_page_19_provider.dart';
import 'package:idlf/page/lessons/lesson_page_20_notification.dart';
import 'package:idlf/page/lessons/lesson_page_21_imagePicker.dart';
import 'package:idlf/page/lessons/lesson_page_22_local_storage.dart';
import 'package:idlf/page/lessons/lesson_page_23_push_notification.dart';
import 'package:idlf/page/lessons/lesson_page_24_local_authentication.dart';
import 'package:idlf/page/lessons/lesson_page_25_map.dart';
import 'package:url_launcher/url_launcher.dart';
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
    Lesson(Icon(Icons.airplanemode_active), 0, "開場白", null),
    Lesson(Icon(IcoFontIcons.laughing), 1, "依然哈囉", null),
    Lesson(Icon(IcoFontIcons.businessMan), 2, "第一印象", null),
    Lesson(Icon(Icons.mail_outline), 3, "跳轉", LessonPageRouting(showWording: "Hello World")),
    Lesson(Icon(Icons.inbox), 4, "佈局", LessonPageLayout()),
    Lesson(Icon(Icons.not_listed_location), 5, "容器", LessonPageChild()),
    Lesson(Icon(Icons.print), 6, "文字與輸入", LessonPageTextAndField()),
    Lesson(Icon(Icons.warning), 7, "按鈕與提示", LessonPageButtonAndDialog()),
    Lesson(Icon(Icons.image), 8, "圖片", LessonPageImage()),
    Lesson(Icon(Icons.call_split), 9, "選擇器", LessonPageSelector()),
    Lesson(Icon(Icons.message), 10, "建立列表", LessonPageListViewChildrenAndBuilder()),
    Lesson(Icon(Icons.format_list_numbered), 11, "列表置頂與刷新", LessonPageListViewHeaderAndRefresh()),
    Lesson(Icon(Icons.format_list_bulleted), 12, "列表輸入與開合", LessonPageListViewTextFieldAndExpansion()),
    Lesson(Icon(Icons.playlist_add_check), 13, "列表多選與側滑", LessonPageListViewCheckBoxAndSwipe()),
    Lesson(Icon(Icons.grid_on), 14, "網格", LessonPageGridView()),
    Lesson(Icon(Icons.dashboard), 15, "特製滾動", LessonPageCustomScrollView()),
    Lesson(Icon(Icons.table_chart), 16, "底部導航與頁籤", LessonPageBottomNavigationAndTabBar()),
    Lesson(Icon(Icons.call_received), 17, "API GET", LessonPageApiGet()),
    Lesson(Icon(Icons.call_made), 18, "API POST", LessonPageApiPost()),
    Lesson(Icon(Icons.accessibility), 19, "Life Cycle", LessonPageLifeCycle()),
    Lesson(Icon(Icons.trending_down), 20, "InheritedWidget", LessonPageInheritedWidget()),
    Lesson(Icon(Icons.wifi), 21, "Provider", LessonPageProvider()),
    Lesson(Icon(Icons.trending_up), 22, "Notification", LessonPageNotification()),
    Lesson(Icon(Icons.image_outlined), 23, "ImagePicker", LessonPageImagePicker()),
    Lesson(Icon(IcoFontIcons.database), 24, "Local Storage", LessonPageLocalStorage()),
    Lesson(Icon(IcoFontIcons.sendMail), 25, "Push Notification", LessonPagePushNotification()),
    Lesson(Icon(IcoFontIcons.fingerPrint), 26, "Local Authentication", LessonPageLocalAuthentication()),
    Lesson(Icon(IcoFontIcons.map), 27, "Map", LessonPageMap()),
  ];

  void _launchURLByNumber(int number) async {
    String url = "";

    switch (number) {
      case 0: url = "https://ithelp.ithome.com.tw/articles/10237645"; break;
      case 1: url = "https://ithelp.ithome.com.tw/articles/10237866"; break;
      case 2: url = "https://ithelp.ithome.com.tw/articles/10237867"; break;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              if (lesson.page != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => lesson.page)
                );
              } else {
                _launchURLByNumber(lesson.lessonNumber);
              }
            },
          );
        },
      ),
    );
  }
}
