// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/sign_in_phone_screen.dart';
import 'package:carlet_flutter/src/ui/screens/auth/verify/verify_otp_screen.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/home_screen.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppNavState state,
  List<Page<dynamic>> pages,
) {
  if (state is SignInPhoneScreenState) {
    return [SignInPhoneScreen.page()];
  }
  if (state is VerifyOtpScreenState) {
    return [VerifyOtpScreen.page()];
  }

  if (state is HomeScreenState) {
    return [HomeScreen.page()];
  } else {
    return [SignInPhoneScreen.page()];
  }
}
