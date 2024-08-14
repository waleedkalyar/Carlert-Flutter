import 'package:carlet_flutter/src/app/views/carlert_app_view.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/views/carlert_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.getInstance().initSharedPreferences();
  runApp(Injector.InjectReposWidget(child: const CarlertApp()));
}
