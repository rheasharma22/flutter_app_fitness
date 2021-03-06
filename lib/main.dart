import 'package:flutter/material.dart';
import 'package:flutterappfitness/MapView.dart';
import 'home.dart';
import 'screen_one.dart';

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/timer': (context) => ScreenOne(),
        '/map': (context) => TestMapPolyline(),
      },
    );
  }
}
