
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/widgets/add_geofence_container_body.dart';
import 'package:flutter/material.dart';

class AddGeofenceContainerPage extends StatelessWidget {
  const AddGeofenceContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appGrayBackground,
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
        backgroundColor: appGrayBackground,
        title: Text(
          addGeoFencing,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: const AddGeofenceContainerBody(),
    );
  }
}
