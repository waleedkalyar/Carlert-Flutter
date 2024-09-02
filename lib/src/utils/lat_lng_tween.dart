import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngTween extends Tween<LatLng> {
  /// Creates a [LatLng] tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as an empty LatLng.
  LatLngTween({required LatLng begin, required LatLng end})
      : super(begin: begin, end: end);

  /// Returns the value this variable has at the given animation clock value.
  @override
  LatLng lerp(double t) {
    double lat, lng;
    if (begin == null) {
      lat = end!.latitude * t;
      lng = end!.longitude * t;
    } else if (end == null) {
      lat = begin!.latitude * (1.0 - t);
      lng = begin!.longitude * (1.0 - t);
    } else {
      print("${begin!.latitude}, ${end!.latitude}, $t");
      lat = lerpDouble(begin!.latitude, end!.latitude, t);
      lng = lerpDouble(begin!.longitude, end!.longitude, t);
    }
    return LatLng(lat, lng);
  }

  @protected
  double lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
