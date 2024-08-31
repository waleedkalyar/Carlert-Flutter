
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/fuel/items/item_fuel.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_search_filter_bar.dart';
import 'package:flutter/material.dart';

class FuelPage extends StatelessWidget {
  const FuelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appGrayBackground,
      appBar: AppBar(
        surfaceTintColor: appTransparent,
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
          fuel,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: appGrayBackground,
        child: Column(
          children: [
            const AppSearchFilterBar(),
            12.height,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return const ItemFuel();
                },
                itemCount: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
