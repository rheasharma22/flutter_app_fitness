import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfitness/MapView.dart';
import 'main.dart';
import 'screen_one.dart';

const kHomePageButton = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/fitnessapp_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100.0, 60.0, 0, 0),
              child: Text(
                "MyFitness, MyLife!",
                style: kFontStyle,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Color(0xFFFE5728),
                      color: Color(0x657F7F7F),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    //margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(5.0),
                    width: 195.0,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenOne(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        "Fit Runner",
                        style: kHomePageButton,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Color(0xFFFE5728),
                      color: Color(0x657F7F7F),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    //margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(5.0),
                    width: 195.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Push Up Helper",
                        style: kHomePageButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
