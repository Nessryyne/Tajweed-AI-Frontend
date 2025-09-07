import 'package:go_router/go_router.dart' show GoRoute;

import '../view/screen/profile_screen.dart';

final profileScreenRoute = GoRoute(
  path: "/profile",
  builder: (context, state) => ProfileScreen(),
);
