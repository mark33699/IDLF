import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

enum Weather {
  sunny,
  rainy,
  typhoon,
  blizzard,
}

class GodWidget extends InheritedWidget {

  final Weather todayWeather;

  GodWidget(this.todayWeather, Widget cho) : super(child: cho);

  static GodWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GodWidget>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}

//-

class LessonPageInheritedWidget extends StatefulWidget {
  @override
  _LessonPageInheritedWidgetState createState() => _LessonPageInheritedWidgetState();
}

class _LessonPageInheritedWidgetState extends State<LessonPageInheritedWidget> {

  String currentMood;
  Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第十八堂課"),
          actions: <Widget>[
            DropdownButton(
              hint: Text("心情？"),
              value: null,
              items: [
                DropdownMenuItem(child: Text("大晴天"), value: Weather.sunny),
                DropdownMenuItem(child: Text("下雨天"), value: Weather.rainy),
                DropdownMenuItem(child: Text("做颱風"), value: Weather.typhoon),
                DropdownMenuItem(child: Text("暴風雪"), value: Weather.blizzard),
              ],
              onChanged: (v){
                setState(() {
                  currentWeather = v;
                });
              }
            )
          ],
        ),
        backgroundColor: Colors.red,
        body: GodWidget(currentWeather, SkyWidget())
    );
  }
}

//-

class SkyWidget extends StatefulWidget {
  @override
  _SkyWidgetState createState() => _SkyWidgetState();
}

class _SkyWidgetState extends State<SkyWidget> {
  @override
  Widget build(BuildContext context) {

    Widget widgetIcon(IconData ico){
      return Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Icon(ico, color: Colors.white, size: 100),
      );
    }


    switch (GodWidget.of(context).todayWeather) {
      case Weather.sunny:
        return widgetIcon(IcoFontIcons.sunny);
      case Weather.rainy:
        return widgetIcon(IcoFontIcons.rainy);
      case Weather.typhoon:
        return widgetIcon(IcoFontIcons.wind);
      case Weather.blizzard:
        return widgetIcon(IcoFontIcons.snow);
      default:
        return Container(child: null, color: Colors.red);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("天意啊～～～");
  }
}
