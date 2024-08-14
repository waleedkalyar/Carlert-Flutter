import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/notifications/chips_notification.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/notifications/item/notification_item.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGrayBackground,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ChipsNotification(
              onChipSelected: (index) {},
            ),
            12.height,
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return const NotificationItem();
                },
                itemCount: 12,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
