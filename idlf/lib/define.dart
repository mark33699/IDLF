import 'package:flutter/material.dart';
import 'dart:math';

import 'package:icofont_flutter/icofont_flutter.dart';

/*
//不work 改天再研究
//https://stackoverflow.com/questions/54151373/is-it-possible-to-select-a-random-icon-in-icons-or-fontawesomeicons-etc
final List<int> points = <int>[0xe0b0, 0xe0b1, 0xe0b2, 0xe0b3, 0xe0b4];
final Random r = Random();
Widget randomIcon() => Icon(IconData(r.nextInt(points.length), fontFamily: 'MaterialIcons'));
*/

Widget randomBrandIcon({Color color = Colors.grey}) {
  final tenIcon = [
    Icon(IcoFontIcons.brandApple, color: color),
    Icon(IcoFontIcons.brandEleven, color: color),
    Icon(IcoFontIcons.brandAndroidRobot, color: color),
    Icon(IcoFontIcons.brandMercedes, color: color),
    Icon(IcoFontIcons.brandMcdonals, color: color),
    Icon(IcoFontIcons.brandStarbucks, color: color),
    Icon(IcoFontIcons.brandTesla, color: color),
    Icon(IcoFontIcons.brandYoutube, color: color),
    Icon(IcoFontIcons.brandPlaystation, color: color),
    Icon(IcoFontIcons.brandPuma, color: color),
  ];
  return tenIcon[Random().nextInt(tenIcon.length)];
}

final rainbowColors = [
  Colors.red,
  Colors.orangeAccent,
  Colors.yellowAccent,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

List<Color> rainbowBlackWhiteColors() {
  //const 变量是一个编译时常量，final变量在第一次使用时被初始化。
  //final還是可以改...只是不能被assign
  //所以好像沒有immutable?
  final List<Color> colors = [];
  colors.addAll(rainbowColors);
  colors.insert(0, Colors.white);
  colors.add(Colors.black);
  return colors;
}

Color random9Color() => rainbowBlackWhiteColors()[Random().nextInt(rainbowBlackWhiteColors().length)];