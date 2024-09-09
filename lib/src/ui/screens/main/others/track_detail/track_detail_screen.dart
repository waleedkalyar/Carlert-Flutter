import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key});

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
          "Tracking Details",
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        12.height,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: appWhite),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                leading: SvgPicture.asset(
                  Assets.assetsIconsLiveMapInactiveCarIcon,
                  width: 36,
                  height: 36,
                ),
                title: Text(
                  "Renault Duster 2020",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    3.height,
                    Text(
                      "Santosh Sahani",
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              4.height,
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: appBlueDark.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plate Number",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    Text(
                      "J 23452",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    )
                  ],
                ),
              ),
              10.height,
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: appBlueDark.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fleet Number",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    Text(
                      "XC01235",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    )
                  ],
                ),
              ),
              6.height
            ],
          ),
        ),
        24.height,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.speed_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "121 Km/s",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "current Speed",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.route,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "9.7K Kms",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "Kilometers",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.local_gas_station,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "35%",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Fuel Level",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.navigation,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "Moving",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "Current State",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.thermostat_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "85°C ", //u2109 ->F, \u2103 -> C
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Engine Temperature",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.battery_full_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "78%",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "Battery Level",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.adf_scanner_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "0 Faults", //u2109 ->F, \u2103 -> C
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "DTC Scan",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.electric_bolt_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "13.95",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "P.S Voltage",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.car_rental_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "0", //u2109 ->F, \u2103 -> C
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Engine RPM",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      horizontalTitleGap: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: appWhite,
                      leading: CircleAvatar(
                        backgroundColor: appGray.withOpacity(0.2),
                        child: const Icon(
                          Icons.door_back_door_rounded,
                          color: appBlack,
                        ),
                      ),
                      title: Text(
                        "Closed",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appBlack,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "Doors Status",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(fontSize: 13, color: appBlack),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],),
    );
  }
}
