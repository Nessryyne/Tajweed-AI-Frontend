part of '../bloc/main_bloc.dart';

extension MainBlocUc on MainBloc {
  Future<void> _initializeLanguage() async {
    final savedLocale = await LocalizationManager.instance.initializeLanguage();
    final languageName = LocalizationManager.instance.getLanguageName(
      savedLocale.languageCode,
    );
    selectedLanguage.value = languageName;
  }

  Future<void> _logout(LogoutEvent event, Emitter<MainStates> emit) async {
    emit(LogoutLoading());
    final result = await mainDataSource.logout();
    if (result) {
      if (globalContext.mounted) globalContext.go(signInRoute.path);
    }
  }

  void _onChangeLanguage(ChangeLanguageEvent event, Emitter<MainStates> emit) {
    if (event.language != null) {
      selectedLanguage.value = event.language!;

      // Get language code and country code
      final languageCode = LocalizationManager.instance.getLanguageCode(
        event.language!,
      );
      final countryCode = LocalizationManager.instance.getCountryCode(
        languageCode,
      );

      LocalizationManager.instance.changeLanguage(
        languageCode,
        countryCode,
        event.context,
      );
      emit(LanguageChanged());
    }
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<MainStates> emit) {
    currentIndex = event.index;
    emit(
      MainNavigationChanged(
        currentIndex: event.index,
        currentRoute: routes[event.index],
      ),
    );
  }
}
