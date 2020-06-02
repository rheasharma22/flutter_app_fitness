import 'package:flutter/material.dart';
import 'package:flutter_timer/flutter_timer.dart';
import 'package:flutterappfitness/MapView.dart';
import 'package:flutterappfitness/getLocation.dart';

const kAppBarStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 4.0,
  color: Colors.white,
);

const kTimerStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  getLocation loc = new getLocation();
  bool running = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fitness Tracker"),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: 220.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Color(0x251919A2),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: TikTikTimer(
                        backgroundColor: Colors.transparent,
                        height: 200.0,
                        width: 200.0,
                        running: running,
                        timerTextStyle: kTimerStyle,
                        initialDate: DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  //color: Color(0xFFFE5728),
                  color: Color(0xFF19BC99),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(5.0),
                width: 195.0,
                child: FlatButton(
                  onPressed: () {
                    loc.fetchLocationData();
                    try {
                      if (running == false)
                        setState(() {
                          running = true;
                        });
                    } on Exception {}
                  },
                  child: Text(
                    "START",
                    style: kButtonTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(5.0),
                    width: 195.0,
                    child: FlatButton(
                      onPressed: () {
                        if (running == true) loc.pos.cancel();
                        print(loc.location_data);
                        setState(() {
                          running = false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestMapPolyline(
                                  m: loc.location_data,
                                ),
                              ));
                        });
                      },
                      child: Text(
                        "STOP",
                        style: kButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
