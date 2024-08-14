// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/waiting_dialog.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/bloc/sign_in_phone_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/sign_in_phone_form.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneScreen extends StatelessWidget {
  const SignInPhoneScreen({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: SignInPhoneScreen());

  @override
  Widget build(BuildContext context) {
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
        body: BlocListener<SignInPhoneBloc, SignInPhoneState>(
          listener: (context, state) {
            if (state is SignInPhoneLoading) {
              debugPrint("SignInPhone: loading");
              context.showProgressDialog(
                  dialog: const WaitingDialog(status: "Sending OTP"));
            }
            if (state is SignInPhoneError) {
              context.hideProgressDialog();
              debugPrint("SignInPhone: error -> ${state.errorMessage}");
              context.showSnack(message: state.errorMessage);
            }
            if (state is SignInPhoneSuccess) {
              context.hideProgressDialog();
              debugPrint("SignInPhone: success -> ${state.successMessage}");
              context.read<AppNavBloc>().add(
                  const NavToVerifyOtpScreen(phoneNumber: "+971 529447229"));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Car Maintenance...\nRevolutionised".toUpperCase(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium
                      ?.copyWith(
                        fontSize: 24,
                        letterSpacing: 3,
                      ),
                ),
                const SizedBox(
                  height: 50,
                ),
               const SignInPhoneForm(),

                //  MaterialButton(onPressed: (){
                // AuthRepo repo =   context.read<AuthRepo>();
                // repo.sendOtpToPhone({"varUserPhone":"971505236134"})
                // .listen((value) {
                //   if (value is NetworkError) {
                //     NetworkError v = value as NetworkError;
                //     debugPrint("Value error -> ${v.message}");
                //   } else if (value is NetworkSuccess) {
                //     NetworkSuccess s = value as NetworkSuccess<BaseResponse<String>>;
                //     BaseResponse res = s.data as BaseResponse;
                //     debugPrint("Value success -> ${res.data}");
                //   }
                // });
                //  }, child: const Text("Click me"),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
