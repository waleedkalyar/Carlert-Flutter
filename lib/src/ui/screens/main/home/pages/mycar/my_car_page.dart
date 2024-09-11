import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car/bloc/my_cars_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/cubit/my_car_cubit.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyCarPage extends StatelessWidget {
  const MyCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appGrayBackground,
        body: BlocProvider(
          create: (context) => MyCarCubit(),
          child: BlocConsumer<MyCarCubit, DeviceModel?>(
            listener: (context, state) {
              if (state != null) {
                context.read<MyCarCubit>().streamCurrentDevice(context);
              }
            },
            builder: (context, state) {
              if (state != null) {
                DeviceModel selected = state;
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: appWhite),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 6),
                            leading: SvgPicture.asset(
                              selected.movementStatus() == MovementState.active
                                  ? Assets
                                      .iconsLiveMapActiveCarIcon
                                  : Assets.assetsIconsLiveMapInactiveCarIcon,
                              width: 36,
                              height: 36,
                            ),
                            title: Text(
                              "${selected.make} ${selected.model} ${selected.year}",
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
                                  selected.driverInfo?.name ?? 'Unknown',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleSmall,
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            decoration: BoxDecoration(
                              color: appBlueDark.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Plate Number",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium,
                                ),
                                Text(
                                  selected.plateCode != null
                                      ? "${selected.plateCode} ${selected.plateNumber}"
                                      : selected.plateNumber,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium,
                                )
                              ],
                            ),
                          ),
                          10.height,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            decoration: BoxDecoration(
                              color: appBlueDark.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fleet Number",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium,
                                ),
                                Text(
                                  selected.fleetNo ?? "Unknown",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${selected.speed} Km/s",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${(selected.kilometers / 1000).toStringAsFixed(1)}K Kms",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${selected.fuelLevel}%",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    selected.aStatus != null
                                        ? selected.displayableStatus()
                                        : "N/A",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${selected.temperature}°C ",
                                    //u2109 ->F, \u2103 -> C
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${selected.batteryPercentage}%",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    "${selected.dtcScan} Faults",
                                    //u2109 ->F, \u2103 -> C
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    selected.powerSourceVolt,
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    selected.engineSize != null
                                        ? "${selected.engineSize}"
                                        : "N/A",
                                    //u2109 ->F, \u2103 -> C
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    selected.doorStatus == 1
                                        ? "Opened"
                                        : "Closed",
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
                                        ?.copyWith(
                                            fontSize: 13, color: appBlack),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "Please select vehicle first",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                );
              }
            },
          ),
        ));
  }
}
