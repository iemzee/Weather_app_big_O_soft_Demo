import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_big_o_soft_demo/consts/colors.dart';

class CoustomThemes {
  static final lightTheme = ThemeData(
      cardColor: Colors.white,
      fontFamily: "BagossStandardTrail",
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Vx.gray800,
      iconTheme: const IconThemeData(
        color: Vx.gray600,
      ));
  static final darkTheme = ThemeData(
      cardColor: bgColor,
      fontFamily: "BagossStandardTrail",
      scaffoldBackgroundColor: bgColor,
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ));
}
