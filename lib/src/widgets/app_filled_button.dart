// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const AppFilledButton({
    super.key,
    required this.child,
    this.gradient = const LinearGradient(colors: <Color>[appGrayGradient2,appGrayGradient1]),
    this.width = double.infinity,
    this.height = 45.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45.0,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          gradient: gradient, boxShadow: [
        BoxShadow(
          color: (Colors.grey[500])!,
          offset: const Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
