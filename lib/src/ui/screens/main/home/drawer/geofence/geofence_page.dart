
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:flutter/material.dart';

class GeofencePage extends StatelessWidget {
  const GeofencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appWhite,
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
        backgroundColor: appWhite,
        title: Text(
          geoFencing,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
