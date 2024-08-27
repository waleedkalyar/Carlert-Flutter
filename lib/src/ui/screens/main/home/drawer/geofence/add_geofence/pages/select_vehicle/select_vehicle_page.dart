import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/select_vehicle/items/select_vehicle_item.dart';
import 'package:flutter/material.dart';

class SelectVehiclePage extends StatelessWidget {
  final Function onContinueClick;

  const SelectVehiclePage({super.key, required this.onContinueClick});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (ctx, index) {
            return const SelectVehicleItem();
          },
          itemCount: 8,
          shrinkWrap: true,
        ),
        Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                onContinueClick();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: appBlack,
              ),
              child: Text(
                "Continue",
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    color: appWhite, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
