import 'package:carlet_flutter/src/ui/screens/main/home/drawer/service_requests/items/item_completed_service_request.dart';
import 'package:flutter/material.dart';

class RequestsCompletedView extends StatelessWidget {
  const RequestsCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(itemBuilder: (ctx,index){
        return const ItemCompletedServiceRequest();
      }, itemCount: 6,),
    );
  }
}
