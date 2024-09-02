// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:math';

import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/carlert_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/animation.dart';

class MarkerAnimation {
  late AnimationController _animationController;
  late Tween<double> _tween;
  late Animation<double> _animation;

  MarkerAnimation(TickerProvider vsync, Duration duration) {
    _animationController =
        AnimationController(vsync: vsync, duration: duration);
    _tween = Tween<double>(begin: 0, end: 100);
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear); //_tween.animate(_animationController);
  }

  Future<void> animateToPosition(
    CarlertMarker marker,
    LatLng startPosition,
    LatLng endPosition,
    Function(CarlertMarker) onPositionUpdate,
  ) async {
    if (startPosition == endPosition) {
      return;
    }
    if (_animationController.isAnimating) {
      _animationController.forward();
    }

    if (_animationController.isAnimating) {
      _animationController.stop();
    }

    _animationController.reset();

    _animation.addListener(() {
      double fraction = _animation.value;
      double lat = startPosition.latitude +
          (endPosition.latitude - startPosition.latitude) * fraction;
      double lng = startPosition.longitude +
          (endPosition.longitude - startPosition.longitude) * fraction;
      LatLng newPosition = LatLng(lat, lng);

      // Update the marker position
      marker = marker.update(newPosition);

      onPositionUpdate(marker);
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Optionally re-enable clustering or any other logic here
        marker = marker.update(endPosition);
      }
    });

    _animationController.forward();
  }

  void dispose() {
    _animationController.dispose();
  }
}
