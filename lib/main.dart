import 'dart:async' show runZonedGuarded;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'src/app/app_widget.dart';
import 'src/app/binding/app_bindings.dart';
import 'src/app/config/app_config.dart';
import 'src/base/datasource/exports.dart';
import 'src/core/api/requester_config.dart';
import 'src/core/managers/localization_manager.dart';
part 'error_handling.dart';

void main() => runZonedGuarded(_application, _recordError);

void _application() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvironment.setupEnvironment(Environment.dev);

  await AppBinding().all();

  ConnectivityPlus.init();

  RequesterConfig.configure();

  await AppConfig.setInitialRoute();
  final savedLocale = await LocalizationManager.instance.initializeLanguage();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: savedLocale, // Use saved locale as starting point
      child: const AppWidget(
        showMaterialGrid: false,
        invertOversizedImages: true,
        showPerformanceOverlay: false,
      ),
    ),
  );
}
