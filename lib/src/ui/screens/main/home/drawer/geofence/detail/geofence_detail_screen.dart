import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/detail/widgets/geofence_map_view.dart';
import 'package:flutter/material.dart';

class GeofenceDetailScreen extends StatelessWidget {
  const GeofenceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appGrayBackground,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          surfaceTintColor: appTransparent,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: appBlack),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back,
                  color: appWhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: appTransparent,
          title: Text(
            "Fence 1234",
            style: Theme.of(context)
                .primaryTextTheme
                .titleMedium
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: const GeofenceMapView(),
      ),
    );
  }
}
