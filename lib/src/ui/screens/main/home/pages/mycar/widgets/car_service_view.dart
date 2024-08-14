import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';

class CarServiceView extends StatelessWidget {
  const CarServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity -12,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: appWhite,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(child: Text("1200 KM", style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal, fontSize: 16),)),
        ),
        Transform.translate(
          offset: const Offset(0, -10),
          child: Wrap(
            children: [
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text("More Details", style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 13
                  ),),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
