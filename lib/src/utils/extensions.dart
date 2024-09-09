import 'dart:math';

import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/waiting_dialog.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/carlert_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animarker/helpers/math_util.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as Math;

extension ToModels on Marker {
  CarlertMarker toCarlertMarker() {
    return CarlertMarker(
      markerId: MarkerId(infoWindow.title.toString()),
      position: position,
      icon: icon, fleetNo: 'Unknown', plateNo: 'Unknown',
    );
  }
}

//VVIP distance measurement
extension ToDistancePosition on LatLng {
  LatLng toNorthPosition(double northDistanceKm) {
    double rEarth = 6378;
    var pi = Math.pi;
    var newLatitude = latitude + (northDistanceKm / rEarth) * (180 / pi);
    return LatLng(newLatitude, longitude);
  }

  LatLng toEastPosition(double eastDistanceKm) {
    double rEarth = 6378;
    var pi = Math.pi;
    var newLongitude = longitude +
        (eastDistanceKm / rEarth) * (180 / pi) / Math.cos(latitude * pi / 180);
    return LatLng(latitude, newLongitude);
  }

  LatLng toSouthPosition(double southDistanceKm) {
    double rEarth = 6378;
    var pi = Math.pi;
    var newLatitude = latitude - (southDistanceKm / rEarth) * (180 / pi);
    return LatLng(newLatitude, longitude);
  }

  LatLng toWestPosition(double westDistanceKm) {
    double rEarth = 6378;
    var pi = Math.pi;
    var newLongitude = longitude -
        (westDistanceKm / rEarth) * (180 / pi) / Math.cos(latitude * pi / 180);
    return LatLng(latitude, newLongitude);
  }

  double toDistanceInMeters(LatLng latLang2){
     return Geolocator.distanceBetween(latitude, longitude, latLang2.latitude, latLang2.longitude);
  }

}

extension LocationsArray on List<LatLng>{

  LatLngBounds computeBounds() {
    assert(isNotEmpty);
    var firstLatLng = first;
    var s = firstLatLng.latitude,
        n = firstLatLng.latitude,
        w = firstLatLng.longitude,
        e = firstLatLng.longitude;
    for (var i = 1; i < length; i++) {
      var latlng = this[i];
      s = min(s, latlng.latitude);
      n = max(n, latlng.latitude);
      w = min(w, latlng.longitude);
      e = max(e, latlng.longitude);
    }
    return LatLngBounds(southwest: LatLng(s, w), northeast: LatLng(n, e));
  }
}





extension EmptySpace on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );

  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}

extension AppPadding on num {
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
}

extension DivideSpace on num {
  Divider get heightDivide => Divider(
        height: toDouble(),
      );
}

extension MediaSizes on BuildContext {
  double get safeHeight =>
      MediaQuery.sizeOf(this).height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get safeHeightWithAppBar =>
      MediaQuery.sizeOf(this).height -
      AppBar().preferredSize.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
}

extension DialogExtension on BuildContext {
  showProgressDialog({required WaitingDialog dialog}) {
    showDialog(
        context: this,
        builder: (BuildContext context) {
          return WillPopScope(child: dialog, onWillPop: () async => false);
        });

    showBottomSheet({required Widget view, bool dismissible = false}) {
      showModalBottomSheet(
          context: this,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          backgroundColor: appWhite,
          isDismissible: dismissible,
          useSafeArea: true,
          showDragHandle: true,
          builder: (ctx) {
            return view;
          });
    }
  }

  hideProgressDialog() {
    Navigator.of(this, rootNavigator: true).pop();
  }

  showSnack(
      {required String message,
      String? actionText,
      Function()? onAction,
      Color? actionTextColor}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: appBlack,
      content: Text(
        message,
        style: Theme.of(this)
            .primaryTextTheme
            .bodySmall
            ?.copyWith(color: appWhite, fontSize: 13),
      ),
      action: actionText != null
          ? SnackBarAction(
              textColor: actionTextColor ?? appGreen,
              label: actionText,
              onPressed: onAction!,
            )
          : SnackBarAction(
              textColor: appGreen,
              label: "Close",
              onPressed: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
            ),
    ));
  }

  showMyModelBottomSheet({required Widget bottomSheet, bool dismissible = false}) {
    showModalBottomSheet(
      context: this,
      builder: (context) => bottomSheet,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: dismissible,
    );
  }

  showPresistentBottomSheet({required Widget bottomSheet,dismissible = false}){
    showBottomSheet( context: this,
      builder: (context) => bottomSheet,
      enableDrag: dismissible,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge);
  }

}
