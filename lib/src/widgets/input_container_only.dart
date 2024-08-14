// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:flutter/material.dart';
import '../app/views/res/colors.dart';

//ignore: must_be_immutable
class InputContainerOnly extends StatelessWidget {
  double? fieldHeight;
  Color? filledColor;
  double? borderRadius;

  Widget child;

  InputContainerOnly(
      {super.key,
      required this.child,
      this.fieldHeight,
      this.filledColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: fieldHeight ?? 52,
        // padding: EdgeInsets.symmetric(horizontal: _isFocused ? 0 : widget.icon != null ? 0 : 12),
        decoration: BoxDecoration(
            color: filledColor ?? appWhite,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0)),
        child: child);
  }
}
