import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4,bottom: 4, left: 12, right: 12),
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Container(
           margin: const EdgeInsets.only(left: 0, right: 0),
           width: 2,
           height: 90,
           color: appGreen,
         ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 12),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: appGrayLight,
                    child: Image.asset("assets/images/img_car_logo.png", width: 28, height: 28,),
                  ),
                  title: RichText(text: TextSpan(children: [
                    TextSpan(text: "Change Break Pad", style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 16)),
                    WidgetSpan(child: Padding(padding: 5.horizontalPadding,)),
                    const WidgetSpan(child: Icon(Icons.circle, size: 4, color: appGray,), alignment: PlaceholderAlignment.middle),
                    WidgetSpan(child: Padding(padding: 1.horizontalPadding,)),
                    TextSpan(text: "12 minutes ago", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 10, color: appGray)),
                  ])),
                  subtitle: Text("Change Break Pad", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: appGrayDark, fontSize: 12),),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  color: appGreen.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(children: [
                        const WidgetSpan(child: Icon(Icons.circle, size: 4, color: appGray,), alignment: PlaceholderAlignment.middle),
                        WidgetSpan(child: Padding(padding: 1.horizontalPadding,)),
                        TextSpan(text: "Service booked successfully", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11, color: appGrayDark)),
                      ])),
                      Text("66503 Km", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 12, color: appGrayDark))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
