import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTitleDetailsPage extends StatefulWidget {
  const AddTitleDetailsPage({super.key});

  @override
  State<AddTitleDetailsPage> createState() => _AddTitleDetailsPageState();
}

class _AddTitleDetailsPageState extends State<AddTitleDetailsPage> {
  bool emailNotification = false;
  bool smsNotification = false;
  bool immobilize = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Geofencing Name", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
            5.height,
            AppTextInputField(
              hint: "Enter Fence Name",
              floatHint: false,
              onUpdateInput: (textValue) {},
            ),
            20.height,
            Text("Notifications", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
            2.height,
            Text(geoNotifyMsg, style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 13, color: appGray),),
            5.height,
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              color: appWhite,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: CupertinoCheckbox(value: smsNotification,activeColor: appBlack, onChanged: (newValue){
                          setState(() {
                            smsNotification = newValue!;
                          });
                        },), alignment: PlaceholderAlignment.middle),
                        TextSpan(text: "SMS Notifications", style: Theme.of(context).primaryTextTheme.bodySmall)
                      ],
                    )),
                    RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: CupertinoCheckbox(value: emailNotification, activeColor: appBlack,onChanged: (newValue){
                          setState(() {
                            emailNotification = newValue!;
                          });
                        },), alignment: PlaceholderAlignment.middle),
                        TextSpan(text: "Email Notifications", style: Theme.of(context).primaryTextTheme.bodySmall)
                      ],
                    )),
                  ],
                ),
              ),
            ),

            20.height,
            Text("Immobilize", style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
            2.height,
            Text(immobilizeMsg, style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 13, color: appYellow),),
            5.height,
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              color: appWhite,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("  Immobilize Vehicles", style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 16),),
                  CupertinoSwitch(value: immobilize, activeColor: appBlack,onChanged: (newValue){
                    setState(() {
                      immobilize = newValue;
                    });
                  })
                ],
                          ),
              ),),
            40.height,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: appBlack,
                ),
                child: Text(
                  "Continue",
                  style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                      color: appWhite, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
