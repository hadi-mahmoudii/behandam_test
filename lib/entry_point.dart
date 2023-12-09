import 'dart:async';

import 'package:behandam/app.dart';
import 'package:behandam/features/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> entryPoint() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xffF9343D)));

    runApp(const App());
  }, (error, stackTrace) async {});
}
