import 'dart:math';

import 'package:latlong/latlong.dart' as llang;
import 'package:latlong/latlong.dart';

final llang.Distance distance = new llang.Distance();
List a = [
  LatLng(32.72476833333334, -97.11499),
  LatLng(32.73072, -97.120915),
  LatLng(32.73072, -97.12073666666666),
  LatLng(32.73072, -97.12060000000001),
  LatLng(32.730731666666664, -97.12042166666667),
  LatLng(32.73074, -97.12030000000001),
  LatLng(32.73074333333333, -97.12012166666666),
  LatLng(32.73074666666666, -97.11994333333332),
  LatLng(32.73074999999999, -97.11975)
];

class dis {
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  double result(Map m) {
    List l = [];
    m.forEach((key, value) {
      l.add(value);
    });
    double res = 0;
    for (int i = 0; i < l.length - 2; i++) {
      res += calculateDistance(
          l[i].latitude, l[i].longitude, l[i + 1].latitude, l[i + 1].longitude);
    }
    return res;
  }

  void main() {
    print("hello");
  }
}
