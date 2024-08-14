import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Car3dModelView extends StatefulWidget {
  const Car3dModelView({Key? key}) : super(key: key);

  @override
  State<Car3dModelView> createState() => _Car3dModelViewState();
}

class _Car3dModelViewState extends State<Car3dModelView> {
  final Flutter3DController _controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 15,
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
            color: appGrayBackground,
            border: Border.all(width: 1, color: appBlack),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
            "Renault Duster - 2021",
            style: Theme.of(context).primaryTextTheme.titleMedium,
          ),
        )),
        Flutter3DViewer(
          controller: _controller,
          src: 'assets/car_two.glb',
        ),
      ],
    );
  }
}
