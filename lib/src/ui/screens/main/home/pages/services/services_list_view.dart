import 'package:carlet_flutter/src/ui/screens/main/home/pages/services/item/service_item.dart';
import 'package:flutter/material.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
        child: ListView.builder(itemBuilder: (ctx, index) {
          return const ServiceItem();
        }, itemCount: 8, shrinkWrap: true,));
  }
}
