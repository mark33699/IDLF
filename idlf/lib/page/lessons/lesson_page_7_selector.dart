import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonPageSelector extends StatefulWidget {
  @override
  _LessonPageSelectorState createState() => _LessonPageSelectorState();
}

class _LessonPageSelectorState extends State<LessonPageSelector> {

  double bottomWidgetHeight = 0.01;
  String choosed = "你選擇的是";
  Widget selector;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    Widget datePicker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        setState(() {
          choosed = "$date";
        });
      }
    );

    Widget actionSheet = CupertinoActionSheet(
      message: Text("選一個你喜歡的圖案吧"),
      cancelButton: CupertinoActionSheetAction(
        child: Text("都不喜歡"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        CupertinoActionSheetAction(
          child: Icon(Icons.all_inclusive),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "無限";
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Icon(Icons.ac_unit),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "冰雪";
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Icon(Icons.help_outline),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "疑問";
            });
          },
        )
      ],
    );

    Widget mediaWrap = Container(
      color: Colors.greenAccent,
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music'),
            onTap: () => {
              setState(() {
                choosed = "音樂";
                Navigator.pop(context);
              })
            }
          ),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video'),
            onTap: () => {
              setState(() {
                choosed = "影片";
                Navigator.pop(context);
              })
            },
          ),
        ],
      ),
    );

    void showModalMediaBottomSheet(context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) => mediaWrap
      );
    }

    void showMediaBottomSheet(BuildContext context, ScaffoldState scaffoldState){
      scaffoldState.showBottomSheet((context) => mediaWrap);
    }

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("第七堂課"),
        ),
        body:SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: RaisedButton(
                            child: Text("iOS DatePicker"),
                            onPressed: (){
                              setState(() {
                                bottomWidgetHeight = (bottomWidgetHeight == 200) ? 0.01 : 200;
                                selector = datePicker;
                                if (bottomWidgetHeight == 0.01) {
                                  choosed = "你選擇的是";
                                }
                              });
                            }),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: RaisedButton(
                            child: Text("Android TimePicker"),
                            onPressed: () async {
                              var date = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now()
                              );
                              setState(() {
                                choosed = date == null ? "沒選= =" : "$date";
                              });
                            }),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: RaisedButton(
                            child: Text("ActionSheet"),
                            onPressed: (){
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => actionSheet
                              );
                            }),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            child: Text("BottomSheet"),
                            onPressed: (){
//                              showModalMediaBottomSheet(context); //蓋頁
                              showMediaBottomSheet(context, scaffoldKey.currentState); //滑動
                            }),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(choosed)
                        ),
                      ],
                    )
                ),
                SizedBox( //好像Column裡不能用 FractionallySizedBox
                  height: bottomWidgetHeight,
                  child: Container(
                    color: Colors.greenAccent,
                    child: selector,
                  ),
                )
              ],
            )
        )
    );
  }
}