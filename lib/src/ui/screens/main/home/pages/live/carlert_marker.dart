// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/models/base_marker.dart';
import 'package:carlet_flutter/src/utils/marker_animation.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class CarlertMarker extends RippleMarker with ClusterItem, BaseMarker {
  CarlertMarker(
      {required super.markerId,
      required this.fleetNo,
      required this.plateNo,
      super.position,
      super.draggable,
      super.icon,
      super.onTap,
      super.flat,
      super.rotation,
      super.visible,
      super.infoWindow,
      super.zIndex,
      super.anchor,
      super.ripple});

  @override
  LatLng get location => position;

  Marker toMarker() => Marker(
        markerId: markerId,
        position: position,
        icon: icon,
        infoWindow: infoWindow,
      );

  String? childMarkerId;

  int? clusterId;

  bool? isCluster;

  double? latitude;

  double? longitude;

  int? pointsSize;

  String fleetNo;
  String plateNo;


  CarlertMarker update(LatLng position) {
    this.copyWith(positionParam: position);
    return this;
  }
}
