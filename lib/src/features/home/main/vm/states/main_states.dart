sealed class MainStates {}

final class MainInitial extends MainStates {}

final class MainNavigationChanged extends MainStates {
  final int currentIndex;
  final String currentRoute;

  MainNavigationChanged({
    required this.currentIndex,
    required this.currentRoute,
  });
}

final class LanguageChanged extends MainStates {}

final class LogoutLoading extends MainStates {}

final class LogoutSuccess extends MainStates {}
