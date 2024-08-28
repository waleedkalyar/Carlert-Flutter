import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../history_map/trip_history_map_view.dart';

class HistoryTripItem extends StatelessWidget {
  const HistoryTripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => const TripHistoryMapView()));
       // context.showBottomSheet(bottomSheet: const TripHistoryMapView());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: appWhite,
            borderRadius: BorderRadius.circular(2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        children: [
                  const WidgetSpan(child: Icon(Icons.signal_cellular_alt, size: 18,)),
                  WidgetSpan(child: 6.width),
                  TextSpan(
                      text: "Top Speed: 101",
                      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                  WidgetSpan(child: 3.width),
                  TextSpan(
                      text: "Km/h",
                      style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(color: appGray, fontSize: 10)),
                ])),
                Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: appBlue,
                    borderRadius: BorderRadius.circular(2)
                  ),
                )
              ],
            ),
            7.height,
            RichText(
                text: TextSpan(
                    children: [
                      const WidgetSpan(child: Icon(Boxicons.bx_ruler, size: 18,), alignment: PlaceholderAlignment.middle,),
                      WidgetSpan(child: 6.width),
                      TextSpan(
                          text: "Distance: 38.69",
                          style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                      WidgetSpan(child: 3.width),
                      TextSpan(
                          text: "Km/h",
                          style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(color: appGray, fontSize: 10)),
                    ])),
            7.height,
            RichText(
                text: TextSpan(
                    children: [
                      const WidgetSpan(child: Icon(Boxicons.bx_time_five, size: 18,), alignment: PlaceholderAlignment.middle),
                      WidgetSpan(child: 6.width),
                      TextSpan(
                          text: "Duration: 32:40",
                          style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                    ])),
            8.height,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Column(
                children: [
                  Text(
                      "Trip Started",
                      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(
                      "Time: 05:45",
                      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(color: appGrayDark, fontSize: 12)),
                ],
              ),
              15.width,
              Column(
                children: [
                  Text(
                      "Trip Ended",
                      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(
                      "Time: 06:17",
                      style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(color: appGrayDark, fontSize: 12)),
                ],
              )
            ],)
          ],
        ),
      ),
    );
  }
}
