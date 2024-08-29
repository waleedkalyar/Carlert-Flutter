import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class ItemPendingServiceRequest extends StatelessWidget {
  const ItemPendingServiceRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration:  BoxDecoration(
        color: appWhite,
        borderRadius:  BorderRadius.circular(4),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const CircleAvatar(radius: 20, backgroundColor: appGrayLight,child: Icon(Icons.pending_actions_rounded, color: appBlack,),),
            5.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Nissan Ultima", style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),),
              Text("Requested By: Santosh Sahani", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11),),
            ],),

          ],),
          12.height,
          Text("Requested Services", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),),
          4.height,
          Text("\u2022 Change the engine oil",style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11, color: appGray)),
          Text("\u2022 Change the oil filter",style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11, color: appGray)),
          Text("\u2022 Fix Brake paddle",style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 11, color: appGray)),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Expanded(
              child: Material(
                color: appTransparent,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: appBlack,width: 1.5),
                    ),
                    child: Center(child: Text("Decline", style: Theme.of(context).primaryTextTheme.titleMedium,)),),
                ),
              ),
            ),
            30.width,
            Expanded(
              child: Material(
                color: appTransparent,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                    decoration: BoxDecoration(
                      color: appBlack,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: appBlack,width: 1.5),
                    ),
                    child: Center(child: Text("Accept", style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(color: appWhite),)),),
                ),
              ),
            ),
          ],),
          8.height,
        ],
      ),
    );
  }
}
