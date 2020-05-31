import 'dart:async';

import 'package:geolocator/geolocator.dart';

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
          : location_data[counter] = (position.latitude.toString() +
              ', ' +
              position.longitude.toString());
      counter++;
    });
  }
}
