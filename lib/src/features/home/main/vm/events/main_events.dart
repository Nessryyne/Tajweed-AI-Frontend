import 'package:tajweed_ai/src/base/screens/exports.dart';

sealed class MainEvents {}

final class ChangeTabEvent extends MainEvents {
  final int index;

  ChangeTabEvent(this.index);
}

final class ChangeLanguageEvent extends MainEvents {
  final String? language;
  final BuildContext context;

  ChangeLanguageEvent(this.language, this.context);
}

final class LogoutEvent extends MainEvents {}
