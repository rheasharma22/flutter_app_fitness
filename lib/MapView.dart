import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMapPolyline extends StatefulWidget {
  Map m;
  TestMapPolyline({Key key, @required this.m}) : super(key: key);

  @override
  _TestMapPolylineState createState() => _TestMapPolylineState(m);
}

class _TestMapPolylineState extends State<TestMapPolyline> {
  Map f;
  _TestMapPolylineState(this.f);
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

  @override
  void initState() {
    super.initState();
    //line segment 1
    f.forEach((key, value) {
      latlngSegment1.add(f[key]);
    });

//    latlngSegment1.add(f[2]);
//    latlngSegment1.add(f[3]);
//    latlngSegment1.add(f[4]);

//    //line segment 2
//    latlngSegment2.add(_lat4);
//    latlngSegment2.add(_lat5);
//    latlngSegment2.add(_lat6);
//    latlngSegment2.add(_lat1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
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
              child: Container(
                color: Colors.black26,
                child: Column(
                  children: <Widget>[
                    Text("Distance:"),
                    Text("Calories:"),
                    Text("Time:")
                  ],
                ),
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
