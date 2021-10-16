// ignore_for_file: unused_import, duplicate_import, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:funtranslate/views/got.dart';
import 'package:funtranslate/views/homePage.dart';
import 'package:funtranslate/views/starwars.dart';
import 'package:funtranslate/views/yoda.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/second': (context) => Yoda(),
      //   '/third': (context) => StarWars(),
      //   '/fourth': (context) => Got(),
      // },
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: 'icon.jpg',
          duration: 3000,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.white,
          nextScreen: HomePage()),
    );
  }
}
