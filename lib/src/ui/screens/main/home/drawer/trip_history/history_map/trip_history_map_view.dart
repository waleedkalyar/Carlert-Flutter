import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/trip_history/history_map/widgets/history_map_view.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TripHistoryMapView extends StatelessWidget {
  const TripHistoryMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGrayBackground,
      body: Stack(
        children: [
          const Positioned(child: HistoryMapView()),
          Positioned(
              top: 50,
              left: 12,
              child: Container(
                    width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: appWhite),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                      icon: const Icon(Icons.arrow_back, size: 20,)))),
          Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: ExpansionTile(
                expansionAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 500), curve: Easing.linear),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                title: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: appBlue, borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      2.width,
                      const Icon(
                        Boxicons.bx_transfer_alt,
                        color: appWhite,
                        size: 22,
                      ),
                      4.width,
                      Text(
                        "TOTAL NUMBER OF TRIPS : 1",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                                color: appWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                backgroundColor: appWhite,
                collapsedBackgroundColor: appWhite,
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                showTrailingIcon: true,
                maintainState: true,
                children: [
                  Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                        leading: const Icon(
                          Boxicons.bx_network_chart,
                          size: 20,
                          color: appGrayDark,
                        ),
                        horizontalTitleGap: 2,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Fleet Number: ",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(color: appGrayDark, fontSize: 14)),
                          TextSpan(
                              text: "SMCB00001",
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 14)),
                        ])),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                        leading: const Icon(
                          Boxicons.bx_time_five,
                          size: 20,
                          color: appGrayDark,
                        ),
                        horizontalTitleGap: 2,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Total Duration: ",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(color: appGrayDark, fontSize: 14)),
                          TextSpan(
                              text: "01:37:20",
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 14)),
                        ])),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                        leading: const Icon(
                          Boxicons.bx_ruler,
                          size: 20,
                          color: appGrayDark,
                        ),
                        horizontalTitleGap: 2,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Total Distance: ",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(color: appGrayDark, fontSize: 14)),
                          TextSpan(
                              text: "82.09 Km",
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 14)),
                        ])),
                      ),
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SvgPicture.asset(
                          Assets.iconsIcCar,
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "Mitsubishi Attrage (2019)",
                          style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Chassis Number: MMDAF13JXKH006954",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: appGray,
                                  ),
                            ),
                            Text(
                              "Plate Number: J 41102",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: appGray,
                                  ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SvgPicture.asset(
                          Assets.iconsIcDriver,
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "Sashit Shrestha",
                          style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Email: s.shreshtha@gmail.com",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: appGray,
                                  ),
                            ),
                            Text(
                              "Phone: 9715634567536",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: appGray,
                                  ),
                            )
                          ],
                        ),
                      ),
                      8.height,
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
