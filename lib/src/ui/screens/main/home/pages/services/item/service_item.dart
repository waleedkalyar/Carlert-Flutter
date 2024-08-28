import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 6.verticalPadding,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: appWhite, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminder Km",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14),
              ),
              Text(
                "66566 KM",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14, color: appGrayDark),
              )
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminder Details",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14),
              ),
              Text(
                "Change air Filter",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14, color: appGrayDark),
              )
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service Details",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14),
              ),
              Text(
                "* Change Ac Filter",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14, color: appGrayDark),
              )
            ],
          ),
          12.height,
          AppFilledButton(
            onPressed: () {},
            width: 100,
            child: Text(
              "Book Now",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
