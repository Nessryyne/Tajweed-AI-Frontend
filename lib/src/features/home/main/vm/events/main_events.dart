sealed class MainEvents {}

final class ChangeTabEvent extends MainEvents {
  final int index;

  ChangeTabEvent(this.index);
}

final class ChangeLanguageEvent extends MainEvents {
  final String? language;

  ChangeLanguageEvent(this.language);
}

final class LogoutEvent extends MainEvents {}
