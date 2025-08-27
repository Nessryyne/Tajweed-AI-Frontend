import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/export.dart';
import '../config/app_config.dart';
import '../../features/auth/4_forgot_password/router/forgot_password_route.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
  initialLocation: AppConfig.initialRoute,
  debugLogDiagnostics: true,
  routes: [signInRoute, signUpRoute, forgotPasswordRoute],
);

BuildContext globalContext = router.routerDelegate.navigatorKey.currentContext!;
