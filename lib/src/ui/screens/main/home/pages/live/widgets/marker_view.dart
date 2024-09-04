// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkerView extends StatelessWidget {
  final String text;

  const MarkerView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        text.isNotEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: appGray, borderRadius: BorderRadius.circular(6)),
                child: Text(text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(
                            fontSize: 9,
                            color: appWhite,
                            fontWeight: FontWeight.bold)),
              )
            : const SizedBox(),
        2.height,
        SvgPicture.asset(
          Assets.iconsLiveMapActiveCarIcon,
          width: 28,
          height: 28,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
