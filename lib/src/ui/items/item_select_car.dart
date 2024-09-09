import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemSelectCar extends StatelessWidget {
  final DeviceModel deviceModel;

  const ItemSelectCar({Key? key, required this.deviceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        tileColor: appWhite,
        selectedTileColor: appWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        onTap: () {},
        leading: SvgPicture.asset(deviceModel.ignitionStatus == 1
            ? Assets.iconsLiveMapActiveCarIcon
            : Assets.iconsLiveMapInactiveCarIcon),
        title: Text(
          "${deviceModel.make} ${deviceModel.model} ${deviceModel.year}",
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontSize: 15),
        ),
        subtitle: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: appGrayBackground,
              ),
              child: Text(
                "Fleet No: XC123",
                style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                    color: appBlack, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            8.width,
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: appGrayBackground,
              ),
              child: Text(
                deviceModel.plateCode != null
                    ? "Plate No: ${deviceModel.plateCode}-${deviceModel.plateNumber}"
                    : "Plate No: ${deviceModel.plateNumber}",
                style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                    color: appBlack, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
