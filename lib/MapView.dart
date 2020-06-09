import 'package:flutter/material.dart';
import 'package:flutterappfitness/screen_one.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'calculateDistance.dart' as dd;

const kFontStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class TestMapPolyline extends StatefulWidget {
  dd.dis obj = new dd.dis();
  Map m;
  Duration d;

  TestMapPolyline({Key key, @required this.m, @required this.d})
      : super(key: key);

  @override
  _TestMapPolylineState createState() => _TestMapPolylineState(m[1]);
}

class _TestMapPolylineState extends State<TestMapPolyline> {
  static LatLng value;
  _TestMapPolylineState(mval) {
    value = mval;
  }

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController controller;

  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();

  static LatLng _lat1 = LatLng(13.035606, 77.562381);
  static LatLng _lat2 = LatLng(13.070632, 77.693071);
  static LatLng _lat3 = LatLng(12.970387, 77.693621);
  static LatLng _lat4 = LatLng(12.858433, 77.575691);
  static LatLng _lat5 = LatLng(12.948029, 77.472936);
  static LatLng _lat6 = LatLng(13.069280, 77.455844);

  LatLng _lastMapPosition = LatLng(32.73072, -97.12118166666666);
  //value;

  @override
  void initState() {
    super.initState();
    //line segment 1
    widget.m.forEach((key, value) {
      latlngSegment1.add(widget.m[key]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your information",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: GoogleMap(
                  //that needs a list<Polyline>
                  polylines: _polyline,
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _lastMapPosition,
                    zoom: 18.0,
                  ),
                  mapType: MapType.normal,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: 320.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Color(0x251919A2),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Distance: ${(widget.obj.result(widget.m) * 0.62137).toStringAsFixed(2)} miles",
                          style: kFontStyle,
                        ),
                        Text(
                          "Calories: ",
                          style: kFontStyle,
                        ),
                        Text(
                          "Time: ${widget.d.inSeconds} seconds",
                          style: kFontStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //color: Color(0xFFFE5728),
                      //color: Color(0xFF19BC99),
                      color: Color(0x251919A2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(5.0),
                    width: 195.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "HOME",
                        style: kButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 2,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 2,
        color: Colors.red,
      ));
    });
  }
}
