import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxpollui/app.dart';
import 'package:voxpollui/git_secret/firebase_options.dart';
import 'package:voxpollui/product/initialize/localization/main_localization.dart';
import 'package:voxpollui/product/services/shared_preferences/shared_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await SharedService.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final theme = await AdaptiveTheme.getThemeMode();
  runApp(MainLocalization(child: MainApp(initialTheme: theme)));
}
