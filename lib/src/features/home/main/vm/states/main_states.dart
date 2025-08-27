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
