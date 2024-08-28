import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/trip_history/items/history_date_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'items/history_trip_item.dart';

class TripHistoryPage extends StatelessWidget {
  const TripHistoryPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: TripHistoryPage());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appGrayBackground,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: appBlack),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back,
                  color: appWhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: appGrayBackground,
          title: Text(
            tripHistory,
            style: Theme.of(context)
                .primaryTextTheme
                .titleMedium
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const HistoryDateItem(),
              );
            },
            itemCount: 6,
          ),
        ),
      ),
    );
  }
}
