import 'package:flutter/material.dart';

import '../constants/constant.dart';

class mytheme{


  static ThemeData Light = ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: const ColorScheme(
        primary: greenColor,
        brightness: Brightness.light,
        onPrimary: greenColor,
        secondary: whiteColor,
        onSecondary: whiteColor,
        error: redColor,
        onError: redColor,
        background: blackColor,
        onBackground: blackColor,
        surface: grayColor,
        onSurface: grayColor,
    ),
    textTheme: TextTheme(
      headline1: const TextStyle(color: whiteColor,fontSize: 22,fontWeight: FontWeight.normal),
      headline2: const TextStyle(color: blublackColor,fontSize: 22,fontWeight: FontWeight.bold),
      headline3: const TextStyle(color: grayColor,fontSize: 13,fontWeight: FontWeight.normal),
      headline4: const TextStyle(color: blublackColor,fontSize: 14,fontWeight: FontWeight.w500),

     // titleSmall: const TextStyle(color: brightgrayColor,fontSize: 10,fontWeight: FontWeight.normal),
     // subtitle1: const TextStyle(color: greenColor,fontSize: 14,fontWeight: FontWeight.normal),
    ),

  );







}