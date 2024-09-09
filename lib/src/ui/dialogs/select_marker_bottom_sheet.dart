import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/others/track_detail/track_detail_screen.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectMarkerBottomSheet extends StatelessWidget {
  const SelectMarkerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            color: appWhite,
          ),
          child: Column(
            children: [
              Container(
                color: appGrayLight,
                width: 100,
                height: 3,
              ),
              16.height,
              ListTile(
                horizontalTitleGap:8,
                tileColor: appWhite,
                selectedTileColor: appWhite,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                onTap: () {},
                leading: SvgPicture.asset(Assets.iconsLiveMapActiveCarIcon),
                title: Text(
                  "Renault Duster 2022",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: appGrayBackground,
                      ),
                      child: Text(
                        "Fleet: XC123",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(
                                color: appBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    8.width,
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: appGrayBackground,
                      ),
                      child: Text(
                        "J 24252",
                        // deviceModel.plateCode != null
                        //     ? "Plate No: ${deviceModel.plateCode}-${deviceModel.plateNumber}"
                        //     : "Plate No: ${deviceModel.plateNumber}",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(
                                color: appBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: appBlueDark.withOpacity(0.8),
                  ),
                  child: RichText(
                      text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                          Icons.speed_rounded,
                          size: 18,
                          color: appWhite,
                        ),
                        alignment: PlaceholderAlignment.middle),
                    WidgetSpan(child: 2.width),
                    TextSpan(
                        text: "121 Kms/h",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(
                                color: appWhite,
                                fontSize: 11,
                                fontWeight: FontWeight.bold))
                  ])),
                ),
              ),
              10.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Material(
                        color: appTransparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        const TrackDetailScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: appBlueDark, width: 1.5),
                            ),
                            child: Center(
                                child: Text(
                              "Details",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium
                                  ?.copyWith(color: appBlueDark),
                            )),
                          ),
                        ),
                      ),
                    ),
                    30.width,
                    Expanded(
                      child: Material(
                        color: appTransparent,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: appBlueDark,
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: appBlueDark, width: 1.5),
                            ),
                            child: Center(
                                child: Text(
                              "Book Service",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium
                                  ?.copyWith(color: appWhite),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
