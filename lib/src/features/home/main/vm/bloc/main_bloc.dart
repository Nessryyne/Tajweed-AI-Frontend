import '../../../../../base/bloc/exports.dart';
import '../../../../../core/managers/localization_manager.dart';
import '../../../../auth/2_sign_in/router/sign_in_route.dart';
import '../../datasource/main_datasource.dart';
import '../events/main_events.dart';
import '../states/main_states.dart';

part '../usecases/main_bloc_uc.dart';

class MainBloc extends BaseBloc<MainEvents, MainStates> {
  final List<String> routes = [
    '/home',
    '/learn',
    '/quran',
    '/practice',
    '/progress',
  ];

  // Get languages from localization manager
  List<String> get languages => LocalizationManager.instance
      .getAvailableLanguages()
      .map((lang) => lang['name']!)
      .toList();

  final selectedLanguage = Observable<String>("English");
  int currentIndex = 0;
  final MainDataSource mainDataSource;
  String get userName => 'John Doe';
  String get userEmail => 'john.doe@example.com';
  String get photoUrl => 'https://via.placeholder.com/150';

  String get screenTitle => routes[currentIndex].substring(1).toUpperCase();

  //!Event caller
  void changeTab(int index) => add(ChangeTabEvent(index));
  void changeLanguage(String? language) =>
      add(ChangeLanguageEvent(language, globalContext));

  void logout() => add(LogoutEvent());

  MainBloc(this.mainDataSource) : super(MainInitial()) {
    on<ChangeTabEvent>(_onChangeTab);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<LogoutEvent>(_logout);
    _initializeLanguage();
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
