import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectVehicleItem extends StatefulWidget {
  const SelectVehicleItem({super.key});

  @override
  State<SelectVehicleItem> createState() => _SelectVehicleItemState();
}

class _SelectVehicleItemState extends State<SelectVehicleItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 0.3,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.liveMapActiveCarIconNoShadow,
              width: 28,
              height: 28,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Mistubishi Lancer",
                style: Theme.of(context).primaryTextTheme.bodySmall,
              ),
              5.height,
              Text(
                "Driver: Santosh",
                style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                    color: appGray, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              8.height,
              Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: appGrayBackground),
                    child: Text(
                      "Fleet No: XC123",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(
                          color: appBlack,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  4.width,
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: appGrayBackground),

                    child: Text(
                      "Plate No: J 13521",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(
                          color: appBlack,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              4.height,
            ],),
            2.width,
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CupertinoCheckbox(
                    value: isSelected,
                    activeColor: appBlack,
                    onChanged: (newValue) {
                      setState(() {
                        isSelected = newValue ?? false;
                      });
                    }),
              ),
            ),

          ],
        ),
      )


    );
  }
}
