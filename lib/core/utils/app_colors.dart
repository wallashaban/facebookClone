import 'package:flutter/material.dart';

class AppColors {
  static  Color scaffold = Colors.grey[400]!; //Color(0xFFF0F2F5);
  static const Color facebookBlue =  Color(0xFF1777F2);
  static const Color online = Color(0xFF4BCB1F);
  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent,Colors.black26,],
  );
  static const Color blue = Colors.blueAccent;
  static const Color green = Colors.green;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color ablack = Colors.black12;
  static Color gray = Colors.grey[200]!;
    static Color lightGray = Colors.grey[400]!;

  static const Color darkGrey = Colors.grey;
}
