import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemKilometers extends StatelessWidget {
  const ItemKilometers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: appGrayLight,
                    child: SvgPicture.asset(
                      Assets.assetsIconsLiveMapInactiveCarIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  5.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nissan Ultima",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        "Driver: Santosh Sahani",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodySmall
                            ?.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: appBlack, width: 1.5),
                ),
                child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                        const WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.route,
                              size: 18,
                            )),
                        WidgetSpan(child: 5.width),
                        TextSpan(
                          text: "12.5K Kms",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium
                              ?.copyWith(fontSize: 12),
                        )
                      ])),
                ),
              )
            ],
          ),
          12.height,
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
            ],
          ),
        ],
      ),
    );
  }
}
