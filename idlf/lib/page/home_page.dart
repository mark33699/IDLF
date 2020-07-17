import 'package:flutter/material.dart';
import 'package:idlf/api.dart';
import 'package:idlf/page/next_page.dart';
import 'package:idlf/page/tab_bar_page_3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var result = "";
  String yearOld = "0";

  void getCount () async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      yearOld = (pref.getString("count") ?? "0");
      print("拿到$yearOld");
    });
  }

  void setCount (String count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("count", count);
      yearOld = count;
      print("設定$yearOld");
    });
  }

  @override
  void initState() {
    super.initState();
    getCount();
    print("初始$yearOld");
    APIManager().getStore();
  }

  @override
  Widget build(BuildContext context) {

//    String yearOld = ""; //放這邊是不會刷新的喔
    TextEditingController textEditingController = new TextEditingController();

    //竟然要先定義才能call????
    void pushNextPage(BuildContext context) async {
      result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(
            currentString: textEditingController.text,)
          )
      );

      setState((){});
    }

    Future<String> showAlert(BuildContext content) async {
      String answer = "";

      return showDialog(
          context: context,
          builder: (BuildContext content) {
            return AlertDialog(
              title: Text("彈窗"),
              content: Row( //用Center會有上下空白, 用Column會下方空很大一塊
                children: <Widget>[
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "請問今年貴庚",
                        hintText: "輸入框就是要輸入啊不然要幹嘛"
                    ),
                    onChanged: (value) {
                      answer = value;
                    },
                  ))
                ],
              ),
              actions: <Widget>[
                RaisedButton(
                    child: Text("好"),
                    onPressed: () {
                      Navigator.pop(context, answer);
                    }),
                RaisedButton(
                    child: Text("才不告訴你～勒～"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    }

    var widgets = <Widget>[
//      TextField(controller: textEditingController),
      OutlineButton(
          child: Text("要去了"),
          onPressed: () async {
//            pushNextPage(context);
             yearOld = await showAlert(context);
             setCount(yearOld);
          }
      ),
//      Text("回禮是 $result")
      Text("您是${ yearOld ?? 0 }歲")
    ];

    var floatingButtons = [
      FloatingActionButton(
        heroTag: 1,
        child: Icon(Icons.add),
        elevation: 0.5,
        onPressed: () {

          int count = int.parse(yearOld);
          count++;
          setCount("$count");

        }),

      SizedBox(width: 10),

      FloatingActionButton(
          heroTag: 2,
          child: Icon(Icons.navigate_next),
          elevation: 0.5,
          onPressed: () {
            print("gogogo");

            Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return NextPage(currentString: "I Love U",);
              }));
          }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),

      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(30),
        child: ListView(
          children: widgets,
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.stretch, //雖然是填滿, 但卻填不滿= =
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        children: floatingButtons,
        mainAxisAlignment: MainAxisAlignment.end,)
    );
  }
}