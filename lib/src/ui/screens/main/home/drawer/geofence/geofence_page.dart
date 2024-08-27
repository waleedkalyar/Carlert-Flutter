import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/add_geofence_container_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/items/item_geofence.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class GeofencePage extends StatelessWidget {
  const GeofencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          geoFencing,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: appBlack,
              borderRadius: BorderRadius.circular(6)

            ),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const AddGeofenceContainerPage()));
                },
                child: RichText(
                    text: TextSpan(
                        children: [
                  const WidgetSpan(child: Icon(Icons.add, color: appWhite, size: 20,), alignment: PlaceholderAlignment.middle),
                  WidgetSpan(child: 4.width),
                  TextSpan(
                      text: "Add",
                      style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(color: appWhite, fontSize: 15))
                ]))),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ItemGeofence();
        },
        itemCount: 8,
      ),
    );
  }
}
