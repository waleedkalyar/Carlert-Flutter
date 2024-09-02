import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/utils/polyline_animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class HistoryMapView extends StatefulWidget {
  const HistoryMapView({super.key});

  @override
  State<HistoryMapView> createState() => _HistoryMapViewState();
}

class _HistoryMapViewState extends State<HistoryMapView> {
  final Set<Marker> _markers = {};
  final Map<PolylineId, Polyline> _polylines = {};
  final PolylineAnimator _animator = PolylineAnimator();
  final completer = Completer<GoogleMapController>();

  static const CameraPosition _kGoogle =
      CameraPosition(target: LatLng(19.0759837, 72.8776559), zoom: 14);

  var _mapStyle = "";

  @override
  void initState() {
    rootBundle.loadString("assets/map/map_style.json").then((value) {
      // debugPrint("Map style -> $value");
      _mapStyle = value;
    });
    //loadJsonFromAssets("assets/map/trip.json");
    super.initState();
  }

  void onMapCreated(GoogleMapController controller) {
    if (!completer.isCompleted) {
      completer.complete(controller);
    }
    loadJsonFromAssets("assets/map/trip.json");
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kGoogle,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      rotateGesturesEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      style: _mapStyle,
      markers: _markers,
      polylines: _polylines.values.toSet(),
      onMapCreated: onMapCreated,
    );
  }

  void loadJsonFromAssets(String filePath) {
    List<LatLng> trip = [];
    rootBundle.loadString(filePath).then((value) {
      //log("TripData : String data -> $value ");
      var jsonTrip = jsonDecode(value) as List<dynamic>;
      for (var modelValue in jsonTrip) {
        var model = modelValue as Map<String, dynamic>;
        // log("TripData : lat -> ${model["lat"]}, lng -> ${model["lng"]}");
        trip.add(LatLng(model["lat"], model["lng"]));
      }

      completer.future.then((controller) {
        controller
            .moveCamera(CameraUpdate.newLatLngBounds(computeBounds(trip), 48));
      });
      setState(() {
        markerIcon(Assets.iconsIcStart).toBitmapDescriptor().then((icon) {
          setState(() {
            _markers.add(Marker(
                markerId: const MarkerId("start"),
                icon: icon,
                position: trip.first));
          });
        });
      });

      _animator.animatePolyline(trip, 'polyline_id', _polylines, (isLast) {
        if (isLast) {
          markerIcon(Assets.iconsIcEnd).toBitmapDescriptor().then((icon) {
            setState(() {
              _markers.add(Marker(
                  markerId: const MarkerId("end"),
                  icon: icon,
                  position: trip.last));
            });
          });
        } else {
          setState(() {});
        }
      });
    });
  }

  Widget markerIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      width: 36,
      height: 36,
      fit: BoxFit.cover,
    );
  }

  LatLngBounds computeBounds(List<LatLng> list) {
    assert(list.isNotEmpty);
    var firstLatLng = list.first;
    var s = firstLatLng.latitude,
        n = firstLatLng.latitude,
        w = firstLatLng.longitude,
        e = firstLatLng.longitude;
    for (var i = 1; i < list.length; i++) {
      var latlng = list[i];
      s = min(s, latlng.latitude);
      n = max(n, latlng.latitude);
      w = min(w, latlng.longitude);
      e = max(e, latlng.longitude);
    }
    return LatLngBounds(southwest: LatLng(s, w), northeast: LatLng(n, e));
  }
}
