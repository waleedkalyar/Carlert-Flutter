import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class AppOtpField extends StatefulWidget {

  Function(String pin) onComplete;
   AppOtpField({Key? key, required this.onComplete}) : super(key: key);

  @override
  _AppOtpFieldState createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OTPTextField(
          controller: otpController,
          length: 4,
          obscureText: true,
          otpFieldStyle: OtpFieldStyle(focusBorderColor: appGray , borderColor: appGray.withOpacity(0.2), ),
          width: MediaQuery.of(context).size.width,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldWidth: 45,
          fieldStyle: FieldStyle.box,
          outlineBorderRadius: 8,
          style: const TextStyle(fontSize: 17),
          onChanged: (pin) {
            print("Changed: " + pin);
          },
          onCompleted: widget.onComplete
      ),
    );
  }
}
