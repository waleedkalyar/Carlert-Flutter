import 'dart:async';

import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class DrawingMapView extends StatefulWidget {
  const DrawingMapView({super.key});

  @override
  State<DrawingMapView> createState() => _DrawingMapViewState();
}

class _DrawingMapViewState extends State<DrawingMapView>  with WidgetsBindingObserver{
  static final Completer<GoogleMapController> _controller = Completer();
  var _mapStyle = "";

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
    rootBundle.loadString("assets/map/map_style.json").then((value) {
      // debugPrint("Map style -> $value");
      _mapStyle = value;
    }).catchError((e) {
      debugPrint("Map style -> $e");
    });
    initDotIcon();
    WidgetsBinding.instance.addObserver(this);
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
          style: _mapStyle,
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
        Positioned(
            left: 12,
            top: 0,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    circleMode = false;
                    clearMap();
                  },
                  label:  Icon(
                    CupertinoIcons.hexagon,
                    color: circleMode ? appBlack : appWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(2),bottomLeft: Radius.circular(2))),
                      backgroundColor: circleMode ? appWhite : appGreen),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      circleMode = true;
                      clearMap();
                    });
                  },
                  label:  Icon(
                    CupertinoIcons.circle,
                    color: circleMode ? appWhite : appBlack,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(2), bottomRight: Radius.circular(2))),
                      backgroundColor: circleMode ? appGreen : appWhite),
                ),
              ],
            )),
        Positioned(
          right: 12,
          top: 0,
          child: ElevatedButton.icon(
          onPressed: () {
              clearMap();
          },
          label: const Icon(
            Icons.delete,
            color: appRed,
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(2), bottomRight: Radius.circular(2))),
              backgroundColor: appWhite),
        ),)
      ],
    );
  }

  void clearMap() {
    setState(() {
      helperMarkers.clear();
      polygons.clear();
      circles.clear();
    });
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
      defaultRadius = radius;
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
        onDrag: (latLang) {
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
