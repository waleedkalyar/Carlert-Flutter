import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/waiting_dialog.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/bloc/sign_in_phone_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/auth/verify/bloc/verify_otp_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/auth/verify/bloc/verify_otp_bloc.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_filled_button.dart';
import 'package:carlet_flutter/src/widgets/app_otp_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  static Page<void> page() =>
      const MaterialPage<void>(child: VerifyOtpScreen());

  @override
  Widget build(BuildContext context) {
    var pinCode = "";
    return SafeArea(
      child: Scaffold(
        backgroundColor: appGrayBackground,
        appBar: AppBar(
          backgroundColor: appGrayBackground,
          title: Text(appName.toUpperCase(),
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineLarge
                  ?.copyWith(letterSpacing: 4, fontSize: 28)),
          centerTitle: true,
        ),
        body: BlocListener<VerifyOtpBloc, VerifyOtpState>(
          listener: (context, state) {
            if (state is VerifyOtpLoading) {
              debugPrint("VerifyOtp: loading");
              context.showProgressDialog(
                  dialog: const WaitingDialog(status: "Verifying OTP"));
            }
            if (state is VerifyOtpFailure) {
              context.hideProgressDialog();
              debugPrint("VerifyOtp: error -> ${state.errorMessage}");
              context.showSnack(message: state.errorMessage);
            }
            if (state is VerifyOtpSuccess) {
              context.hideProgressDialog();
              debugPrint("VerifyOtp: success -> ${state.userModel}");
              context.read<AppNavBloc>().add(const NavToHomeScreen());
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Enter OTP",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium
                      ?.copyWith(
                        fontSize: 24,
                        letterSpacing: 3,
                      ),
                ),
                Text(
                  "Enter OTP you just received on your phone",
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                          ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppOtpField(onComplete: (pin) {
                  pinCode = pin;
                }),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Havn't received the Otp?",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            //TODO: resend OTP
                          },
                          child: Text(" Click Resend",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900)),
                        ))
                  ])),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppFilledButton(
                    child: Text(
                      revolutionise.toUpperCase(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      if (pinCode.isEmpty || pinCode.length < 4) {
                        context.showSnack(
                            message:
                                "Please enter valid pin of 4 digits first");
                      } else {
                        debugPrint('OTP code is -> $pinCode');

                        var phone = (context.read<SignInPhoneBloc>().state
                        as SignInPhoneSuccess)
                            .fullPhoneNumber;

                        debugPrint('Full phone is -> $phone');

                        context.read<VerifyOtpBloc>().add(SendOtpCodeToVerify(
                            otpCode: pinCode,
                            phoneNumber: phone));
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
