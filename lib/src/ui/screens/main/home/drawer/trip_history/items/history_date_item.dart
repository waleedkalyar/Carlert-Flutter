import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/ui/screens/auth/verify/verify_otp_screen.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/trip_history/items/history_trip_item.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class HistoryDateItem extends StatefulWidget {
  const HistoryDateItem({super.key});

  @override
  State<HistoryDateItem> createState() => _HistoryDateItemState();
}

class _HistoryDateItemState extends State<HistoryDateItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expansionAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 400), curve: Easing.linear),
      title:  Text(
        "TRIP DATE: THU AUG 22 2024",
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .primaryTextTheme
            .bodyMedium
            ?.copyWith(color: appWhite, fontSize: 14),
      ),
      showTrailingIcon: true,
      maintainState: true,
      onExpansionChanged: (value){
        setState(() {
          _isExpanded = value;
        });
      },
      leading: const Icon(
        Icons.calendar_month,
        color: appWhite,
      ),
      dense: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "2",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: appWhite, fontSize: 14),
          ),
          AnimatedRotation(
            turns: _isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds:  300),
            child: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 42,
              fill: 1,
              color: appWhite,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      collapsedBackgroundColor: appBlue,
      backgroundColor: appBlue,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      tilePadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      minTileHeight: 32,
      children: [
        Container(
          color: appGrayBackground,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return const HistoryTripItem();
            },
            itemCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        )
      ],
    );
  }
}
