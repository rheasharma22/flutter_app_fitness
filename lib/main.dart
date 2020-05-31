import 'package:flutter/material.dart';
import 'package:flutterappfitness/MapView.dart';

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
        '/': (context) => ScreenOne(),
        '/map': (context) => Map_view(),
      },
    );
  }
}
