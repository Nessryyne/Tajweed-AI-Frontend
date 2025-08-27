import 'package:go_router/go_router.dart' show GoRoute;

import '../view/screen/forgot_password_screen.dart';

final forgotPasswordRoute = GoRoute(
  path: "/forgot-password",
  builder: (_, __) => ForgotPasswordScreen(),
);
