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
}
