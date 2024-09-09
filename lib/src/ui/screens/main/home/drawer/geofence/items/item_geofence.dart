import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/detail/geofence_detail_screen.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemGeofence extends StatelessWidget {
  const ItemGeofence({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: appGrayLight,
          blurRadius: 1.5,
          spreadRadius: 0.0,
          offset: Offset(1.5, 1.5), // shadow direction: bottom right
        )
      ], color: appWhite, borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: appBlack, width: 2)),
              child: const Icon(
                CupertinoIcons.map_pin_ellipse,
                size: 20,
              )),
          8.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "GeoFence 231",
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
            5.height,
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: appBlack,
              ),
              child: Text(
                "Type:Circle",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(
                    color: appWhite,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 0),
                      child: SvgPicture.asset(
                        Assets.iconsLiveMapActiveCarIconNoShadow,
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        Assets.iconsLiveMapActiveCarIconNoShadow,
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(
                        Assets.iconsLiveMapActiveCarIconNoShadow,
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                4.height,
                Text(
                  "12 vehicles",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodySmall
                      ?.copyWith(fontSize: 9),
                )
                          ],),
              ),
            )
        ],),
        15.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: appGrayBackground,
              ),
              child: Text(
                "Fleet No: XC123",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(
                    color: appBlack,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
            7.width,
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: appGrayBackground,
              ),
              child: Text(
                "Plate No: J 13521",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(
                    color: appBlack,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],),

        ],),
        12.height,
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              print("fence detail tapped");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const GeofenceDetailScreen()));
            },
            child: Container(
                margin: const EdgeInsets.only(bottom: 0, right: 0, top: 0),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: appTransparent,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: appBlueDark, width: 2)),
                child: Text(
                  "View In Map",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                )),
          ),
        ),
      ],),
    );
  }
}
