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
      child: ListTile(
        minLeadingWidth: 0,
        leading: SvgPicture.asset(
          Assets.liveMapActiveCarIconNoShadow,
          width: 28,
          height: 28,
          fit: BoxFit.fill,
        ),
        title: Text(
          "Mistubishi Lancer",
          style: Theme.of(context).primaryTextTheme.bodySmall,
        ),
        isThreeLine: false,
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.height,
            Text(
              "Driver: Santosh",
              style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                  color: appGray, fontSize: 12, fontWeight: FontWeight.bold),
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
                    style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
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
                    style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
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
            ),
            4.height,
          ],
        ),
        trailing: CupertinoCheckbox(
            value: isSelected,
            activeColor: appBlack,
            onChanged: (newValue) {
              setState(() {
                isSelected = newValue ?? false;
              });
            }),
      ),
    );
  }
}
