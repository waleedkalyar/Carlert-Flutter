// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/app/routes/routes.dart';
import 'package:carlet_flutter/src/app/views/res/themes.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarlertAppView extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const CarlertAppView({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    var navState = context.select((AppNavBloc bloc) => bloc.state);
    return AdaptiveTheme(
          light: appLightTheme,
          dark: appDarkTheme,
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              title: "Carlert",
              home: FlowBuilder<AppNavState>(
                state: navState,
                onGeneratePages: onGenerateAppViewPages,
              )
         ),
    );
  }
}
