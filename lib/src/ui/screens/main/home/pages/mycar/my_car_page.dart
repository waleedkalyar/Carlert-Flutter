import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/widgets/car_3d_model_view.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/widgets/car_service_view.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_switch.dart';
import 'package:flutter/material.dart';

class MyCarPage extends StatelessWidget {
  const MyCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGrayBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: appWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2)),
              ),
              child: const Car3dModelView(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: appWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(2),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.signal_cellular_alt,
                        size: 36,
                        color: appGreen,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "93",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(color: appGreen, fontSize: 26),
                        ),
                        TextSpan(
                            text: "  KM",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12)),
                      ])),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Remaining\nRange",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.speed_rounded,
                        size: 36,
                        color: appBlack,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "70246",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(color: appBlack, fontSize: 26),
                        ),
                        TextSpan(
                            text: "  KM",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12)),
                      ])),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Total\nKilometers",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.battery_charging_full_rounded,
                        size: 36,
                        color: appGreen,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "67",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(color: appGreen, fontSize: 26),
                        ),
                        TextSpan(
                            text: "  %",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12)),
                      ])),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Battery\nHealth",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 16-6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next Service\ndue in", style: Theme.of(context).primaryTextTheme.bodySmall,),
                      2.height,
                      const CarServiceView(),
                      8.height,
                      const Divider(height: 1,),
                      24.height,
                      Text("Total drive this month", style: Theme.of(context).primaryTextTheme.bodySmall,),
                      2.height,
                      const CarServiceView(),
                      8.height,
                    ],
                  ),
                ),
               // const SizedBox(width: 12,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 16-6,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "DTC SCAN",
                          style:
                              Theme.of(context).primaryTextTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          "Fault Found",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineSmall
                              ?.copyWith(fontSize: 12),
                        ),
                        trailing: Text(
                          "0",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineLarge
                              ?.copyWith(color: appGreen, fontSize: 20),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        tileColor: appWhite,
                      ),
                      8.height,
                      ListTile(
                        title: Text(
                          "IGNITION",
                          style:
                              Theme.of(context).primaryTextTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          "Ignition Status",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineSmall
                              ?.copyWith(fontSize: 12),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Icon(
                                Icons.power_settings_new_rounded,
                                color: appRed,
                                size: 26,
                              ),
                              onTap: () {},
                            ),
                            Text("Off", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11),)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        tileColor: appWhite,
                      ),
                      8.height,
                      ListTile(
                        title: Text(
                          "TEMP",
                          style:
                              Theme.of(context).primaryTextTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          "Engine Temp",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineSmall
                              ?.copyWith(fontSize: 12),
                        ),
                        trailing: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "92",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headlineLarge
                                    ?.copyWith(color: appGreen, fontSize: 20)),
                            TextSpan(
                                text: " \u00b0C",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headlineLarge
                                    ?.copyWith(color: appBlack, fontSize: 12))
                          ]),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        tileColor: appWhite,
                      ),
                      8.height,
                      ListTile(
                        title: Text(
                          "TRACKING",
                          style:
                              Theme.of(context).primaryTextTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          "Tracking Status",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineSmall
                              ?.copyWith(fontSize: 12),
                        ),
                        trailing: const AppSwitch(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        tileColor: appWhite,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
