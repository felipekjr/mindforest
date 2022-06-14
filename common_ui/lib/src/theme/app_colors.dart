import 'package:flutter/widgets.dart';

class AppColors {
  static LinearGradient gradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff1E5176), 
      Color(0xff5DBD95),
    ],
  );


  static Color primary = const Color(0xff5DBD95);
  static Color secondary = const Color(0xffB8A981);
  static Color black = const Color(0xff282A36);
  static Color grey = const Color(0xffBBBBBB);
  static Color foreground = const Color(0xffFFFFFF);
  static Color currentLine = const Color(0xff525461);
  static Color red = const Color(0xffF48D7E);
  static Color cyan = const Color(0xff8BE9FD);
  static Color yellow = const Color(0xfff1fa8c);
  static Color purple = Color.fromARGB(255, 163, 127, 215);
  static Color pink = const Color(0xffff79c6);
  static Color comment = const Color(0xff6272a4);
}