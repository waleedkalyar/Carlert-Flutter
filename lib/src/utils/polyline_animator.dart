import 'dart:developer';

import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class PolylineAnimator {
  late Stream<LatLng> stream;

  void animatePolyline(
    List<LatLng> points,
    String id,
    Map<PolylineId, Polyline> polylines,
    Function(bool isLast) updatedPolyline,
  ) {
    PolylineId polylineId = PolylineId(id);

    polylines[polylineId] = Polyline(
      polylineId: polylineId,
      color: Colors.black,
      width: 5,
      points: [points.first],
      zIndex: 2,
    );

    stream = Stream.periodic(
            const Duration(milliseconds: 15), (count) => points[count])
        .take(points.length);

    stream.forEach((position) {
      if (polylines[polylineId] != null) {
        var updatePoints = List<LatLng>.from(polylines[polylineId]!.points);
        updatePoints.add(position);
        polylines[polylineId] = polylines[polylineId]!
            .copyWith(pointsParam: updatePoints, colorParam: appBlack);
        updatedPolyline(position == points.last);
       // log("Polyline point -> ${polylines[polylineId]!.points.length} updated");
      }
    });
  }

  void dispose() {
    //TODO: add later
  }

}
