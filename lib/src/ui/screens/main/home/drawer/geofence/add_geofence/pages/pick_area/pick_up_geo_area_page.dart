import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/pick_area/widgets/drawing_map_view.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/pick_area/widgets/map_page.dart';
import 'package:flutter/material.dart';

class PickUpGeoAreaPage extends StatelessWidget {
  final Function onContinueClick;
  const PickUpGeoAreaPage({super.key, required this.onContinueClick});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(child: const DrawingMapView(),),
        // Positioned(
        //     bottom: 24,
        //     left: 16,
        //     right: 16,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         onContinueClick();
        //       },
        //       style: ElevatedButton.styleFrom(
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(4)),
        //         backgroundColor: appBlack,
        //       ),
        //       child: Text(
        //         "Continue",
        //         style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
        //             color: appWhite, fontSize: 14, fontWeight: FontWeight.bold),
        //       ),
        //     )),
      ],
    );
  }
}
