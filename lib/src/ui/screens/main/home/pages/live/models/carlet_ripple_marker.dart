// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/models/base_marker.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class CarletRippleMarker extends RippleMarker with ClusterItem {

   CarletRippleMarker({required super.markerId});

  @override

  LatLng get location => super.position;
}