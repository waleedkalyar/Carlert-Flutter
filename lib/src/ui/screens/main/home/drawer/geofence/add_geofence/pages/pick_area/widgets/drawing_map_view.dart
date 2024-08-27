import 'dart:async';

import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class DrawingMapView extends StatefulWidget {
  const DrawingMapView({super.key});

  @override
  State<DrawingMapView> createState() => _DrawingMapViewState();
}

class _DrawingMapViewState extends State<DrawingMapView> {
  static final Completer<GoogleMapController> _controller = Completer();

  final Map<MarkerId, Marker> helperMarkers = {};

  BitmapDescriptor? dotIcon;

  List<Polygon> polygons = [];
  List<Circle> circles = [];

  bool circleMode = false;

  double defaultRadius = 120; //in meters

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.0827, 80.2707),
    zoom: 16.4746,
  );

  @override
  void initState() {
    initDotIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          myLocationButtonEnabled: false,
          markers: helperMarkers.values.toSet(),
          polygons: polygons.toSet(),
          circles: circles.toSet(),
          onTap: (latLang) {
            if (circleMode) {
              setState(() {
                helperMarkers.clear();
                checkAndUpdateCircle(latLang, false);
              });
            } else {
              setState(() {
              //  helperMarkerFromLatLang(latLang);
                updateMarker(MarkerId(DateTime.now().toString()), latLang);
                checkAndUpdatePolygon();
              });
            }
          },
        ),
      ],
    );
  }

  helperMarkerFromLatLang(LatLng latLang) {
    MarkerId markerId = MarkerId(DateTime.now().toString());
    Marker marker = Marker(
        markerId: markerId,
        position: latLang,
        anchor: const Offset(0.5, 0.5),
        icon: dotIcon ?? BitmapDescriptor.defaultMarker,
        draggable: true,
        onDragEnd: (latLang) {
          setState(() {
            if (markerId.value != "radius") {
              updateMarker(markerId, latLang);
            }
            if (circleMode) {
              checkAndUpdateCircle(latLang, markerId.value == "radius");
            } else {
              checkAndUpdatePolygon();
            }
          });
        });
    helperMarkers[markerId] = marker;
  }

  initDotIcon() {
    const SizedBox(
        width: 26,
        height: 26,
        child: Icon(
          Icons.circle,
          size: 26,
          color: appRed,
        )).toBitmapDescriptor().then((icon) {
      dotIcon = icon;
    });
  }

  void checkAndUpdatePolygon() {
    polygons.clear(); // because we need
    if (polygons.isEmpty) {
      polygons.add(Polygon(
          polygonId: const PolygonId("polygon"),
          points:
              helperMarkers.values.map((marker) => marker.position).toList(),
          fillColor: appGreen.withOpacity(0.4),
          strokeColor: appGreen,
          strokeWidth: 2));
    }
  }

  void checkAndUpdateCircle(LatLng latLang, bool isRadiusDrag) {
    print("checkAndUpdateCircle() is Radius Drag -> $isRadiusDrag");
    if (isRadiusDrag) {
      LatLng center = circles.first.center;
      double radius = center.toDistanceInMeters(latLang);
      circles.clear();
      circles.add(Circle(
          circleId: const CircleId("circle"),
          center: center,
          radius: radius,
          fillColor: appGreen.withOpacity(0.4),
          strokeWidth: 2,
          strokeColor: appGreen));
      updateMarker(const MarkerId("center"), center);
      updateMarker(const MarkerId("radius"), latLang);
    } else {
      circles.clear();
      circles.add(Circle(
          circleId: const CircleId("circle"),
          center: latLang,
          radius: defaultRadius,
          fillColor: appGreen.withOpacity(0.4),
          strokeWidth: 2,
          strokeColor: appGreen));
      updateMarker(const MarkerId("center"), latLang);
      updateMarker(const MarkerId("radius"),
          latLang.toEastPosition(defaultRadius / 1000));
    }
  }

  void updateMarker(MarkerId markerId, LatLng latLang) {
    Marker marker = Marker(
        markerId: markerId,
        position: latLang,
        icon: dotIcon ?? BitmapDescriptor.defaultMarker,
        anchor: const Offset(0.5, 0.5),
        draggable: true,
        onDragEnd: (latLang) {
          setState(() {
            if (circleMode) {
              checkAndUpdateCircle(latLang, markerId.value == "radius");
            } else {
                updateMarker(markerId, latLang);
                checkAndUpdatePolygon();

            }
          });
        });
    helperMarkers[markerId] = marker;
  }
}
