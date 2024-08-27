import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
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
      decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
              color: appGrayLight,
              blurRadius: 1.5,
              spreadRadius: 0.0,
              offset: Offset(1.5, 1.5), // shadow direction: bottom right
            )
          ],
          color: appWhite, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            minLeadingWidth: 0,
            leading: Container(
              padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: appBlack, width: 2)
                ),
                child: const Icon(CupertinoIcons.map_pin_ellipse, size: 20,)),
            title: Text(
              "GeoFence 231",
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
            isThreeLine: false,
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.height,
                Chip(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: const EdgeInsets.all(0),
                  elevation: 0,
                  label: Text(
                    "Type:Circle",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(
                            color: appWhite,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  side: const BorderSide(width: 0, color: appTransparent),
                  surfaceTintColor: appBlack,
                  backgroundColor: appBlack,
                ),
                8.height,
                Row(
                  children: [
                    Chip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      labelPadding: const EdgeInsets.all(0),
                      elevation: 0,
                      label: Text(
                        "Fleet No: XC123",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(
                                color: appBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      side: const BorderSide(width: 0, color: appTransparent),
                      surfaceTintColor: appGrayBackground,
                      backgroundColor: appGrayBackground,
                    ),
                    7.width,
                    Chip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      labelPadding: const EdgeInsets.all(0),
                      elevation: 0,
                      label: Text(
                        "Plate No: J 13521",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(
                                color: appBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      side: const BorderSide(width: 0, color: appTransparent),
                      surfaceTintColor: appGrayBackground,
                      backgroundColor: appGrayBackground,
                    ),
                  ],
                )
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                18.height,
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 0),
                      child: SvgPicture.asset(
                        Assets.liveMapActiveCarIconNoShadow,
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        Assets.liveMapActiveCarIconNoShadow,
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(
                        Assets.liveMapActiveCarIconNoShadow,
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
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 12, right: 12, top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: appTransparent,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(color: appGreen, width: 2)),
                child:  Text("View In Map", style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 14),)),
          ),
        ],
      ),
    );
  }
}
