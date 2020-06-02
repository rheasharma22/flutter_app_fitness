import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class getLocation {
  StreamSubscription<Position> pos;
  LocationOptions locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
      forceAndroidLocationManager: true,
      timeInterval: 5);
  int counter = 1;
  var location_data = new Map();
  void fetchLocationData() {
    pos = Geolocator()
        .getPositionStream(locationOptions)
        .listen((Position position) {
      position == null
          ? 'Unknown'
          : location_data[counter] =
              LatLng(position.latitude, position.longitude);
      counter++;
    });
  }
}
