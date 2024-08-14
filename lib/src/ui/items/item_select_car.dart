import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';

class ItemSelectCar extends StatelessWidget {
  final DeviceModel deviceModel;
  const ItemSelectCar({Key? key, required this.deviceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: appGray,
      selectedTileColor: appGray,
      onTap: (){},
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: appGrayLight,
        child: Image.network(deviceModel.logo, width: 32, height: 32,),
      ),
      title: Text(deviceModel.make, style: Theme.of(context).primaryTextTheme.bodyMedium,),
      subtitle: Text("${deviceModel.model} ${deviceModel.year}", style: Theme.of(context).primaryTextTheme.bodySmall,),
    );
  }
}
