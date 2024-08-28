import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class GeofenceMapView extends StatefulWidget {
  const GeofenceMapView({super.key});

  @override
  State<GeofenceMapView> createState() => _GeofenceMapViewState();
}

class _GeofenceMapViewState extends State<GeofenceMapView>
    with WidgetsBindingObserver {
  var _mapStyle = "";
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.0827, 80.2707),
    zoom: 17.4746,
  );

  List<Polygon> polygons = [];
  List<Circle> circles = [];

  bool _isExpanded = false;

  late GoogleMapController controller;

  @override
  void initState() {
    rootBundle.loadString("assets/map/map_style.json").then((value) {
      // debugPrint("Map style -> $value");
      _mapStyle = value;
    }).catchError((e) {
      debugPrint("Map style -> $e");
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          style: _mapStyle,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          circles: circles.toSet(),
          polygons: polygons.toSet(),
          onMapCreated: (controller){
            this.controller = controller;
            loadCircleGrid();
          },
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ExpansionTile(
              dense: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              collapsedBackgroundColor: appBlue,
              backgroundColor: appBlue,
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              tilePadding: const EdgeInsets.symmetric(horizontal: 6),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Vehicles in this Fence",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyMedium
                      ?.copyWith(color: appWhite, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              showTrailingIcon: true,
              maintainState: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "06",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appWhite,
                            fontSize: 14),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 42,
                      fill: 1,
                      color: appWhite,
                    ),
                  ),
                ],
              ),
              onExpansionChanged: (isExpanded){
                setState(() {
                  _isExpanded = isExpanded;
                });

                controller.animateCamera(CameraUpdate.zoomTo(isExpanded ? 16.8 :17.47));
              },

              children: [
                Container(
                  color: appWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Flexible(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      itemBuilder: (ctx, Index) {
                        return Row(
                          children: [
                            SvgPicture.asset(
                              Assets.liveMapActiveCarIconNoShadow,
                              width: 24,
                              height: 24,
                            ),
                            8.width,
                            Text(
                              "Renault Duster",
                              style: Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ],
                        );
                      },
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            5.height,
                            const Divider()
                          ],
                        );
                    },
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  loadCircleGrid() {
    Circle circle = Circle(
        circleId: const CircleId("circle"),
        center: _kGooglePlex.target,
        radius: 120,
        fillColor: appGreen.withOpacity(0.4),
        strokeWidth: 2,
        strokeColor: appGreen);
    setState(() {
      circles.add(circle);
      controller.animateCamera(CameraUpdate.newLatLng(_kGooglePlex.target));
    });
  }
}
