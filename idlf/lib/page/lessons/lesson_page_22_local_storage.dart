import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonPageLocalStorage extends StatefulWidget {
  @override
  _LessonPageLocalStorageState createState() => _LessonPageLocalStorageState();
}

class _LessonPageLocalStorageState extends State<LessonPageLocalStorage> {

  bool isSearching = false;
  List<String> keywords = [];

  void getRecentKeywords () async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      keywords = pref.getStringList("RecentKeywords") ?? [];
    });
  }

  void setRecentKeywords () async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("RecentKeywords", keywords);
  }

  @override
  void initState() {
    super.initState();
    getRecentKeywords();
  }

  @override
  Widget build(BuildContext context) {

    final normalAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.search),
        onPressed: (){
          setState(() {
            isSearching = true;
          });
        },
      ),
      title: Text("Local Storage"),
    );

    final searchAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          setState(() {
            isSearching = false;
          });
        },
      ),
      title: Container(
          padding: EdgeInsets.only(bottom: 16),
          child: TextField(
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.search,
            cursorColor: Colors.white,
            autofocus: true,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )
            ),
            onSubmitted: (string){
              setState(() {
                isSearching = false;
                keywords.insert(0, string);
                setRecentKeywords();
              });
            },
          )
      ),
    );

    return Scaffold(
        appBar: isSearching ? searchAppBar : normalAppBar,
        body: ListView.builder(
          itemCount: keywords.length,
          itemBuilder: (ctx, idx) => ListTile(title: Text(keywords[idx]))
        )
    );
  }
}