import 'package:flutter/animation.dart';

class ColorList {
  static Color getColor() {
    return colorList[count == 9 ? count = 0 : count];
  }

  static void initColor() {
    count = 0;
  }

  static List<Color> colorList = [
    Color.fromARGB(255, 210, 114, 114),
    Color.fromARGB(255, 18, 167, 213),
    Color.fromARGB(255, 93, 174, 26),
    Color.fromARGB(255, 165, 210, 32),
    Color.fromARGB(255, 161, 170, 126),
    Color.fromARGB(255, 143, 7, 102),
    Color.fromARGB(255, 210, 114, 114),
    Color.fromARGB(255, 18, 167, 213),
    Color.fromARGB(255, 77, 86, 106),
    Color.fromARGB(255, 93, 174, 26)
  ];
  static int count = 0;
}
