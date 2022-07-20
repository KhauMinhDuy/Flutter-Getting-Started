// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getting_started/screens/bmi_screen.dart';
import 'package:getting_started/screens/intro_screen.dart';
import 'package:getting_started/screens/weather_screen.dart';

void main(List<String> args) {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueGrey
        ),
        routes: {
          '/': (context) => IntroScreen(),
          '/bmi': (context) => BmiScreen(),
          '/weather': (context) => WeatherScreen(),
        },
        initialRoute: '/',
      );
  }
}
