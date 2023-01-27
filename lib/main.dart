import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news/shared/styles/mytheme.dart';
import 'package:news/ui/layout/home/home_layout.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/news_fragment.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      routes:
      {
        HomeLayout.routname:(context) => HomeLayout(),
      },
      initialRoute: HomeLayout.routname,
      theme: mytheme.Light,
      themeMode: ThemeMode.light,
    );
  }
}