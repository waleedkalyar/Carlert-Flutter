import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/app/views/carlert_app_view.dart';
import 'package:carlet_flutter/src/ui/screens/auth/signin/bloc/sign_in_phone_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/auth/verify/bloc/verify_otp_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/bloc/live_markers_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/bloc/my_cars_bloc.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarlertApp extends StatelessWidget {
  const CarlertApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AppNavBloc>(
          create: (context) => AppNavBloc(context.read<AuthRepo>())),
      BlocProvider<SignInPhoneBloc>(
          create: (context) => SignInPhoneBloc(context.read<AuthRepo>())),
      BlocProvider<VerifyOtpBloc>(
          create: (context) => VerifyOtpBloc(context.read<AuthRepo>())),
      BlocProvider<MyCarsBloc>(
        create: (context) => MyCarsBloc(context.read<VehicleRepo>()),
      ),
      BlocProvider<LiveMarkersBloc>(
          create: (context) => LiveMarkersBloc(context.read<VehicleRepo>()))
    ], child: const CarlertAppView());
  }
}
