import 'package:flutter/material.dart';

class Map_view extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "Maps will be here",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
