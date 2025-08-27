import '../../../../../base/bloc/exports.dart';
import '../events/main_events.dart';
import '../states/main_states.dart';

class MainBloc extends BaseBloc<MainEvents, MainStates> {
  final List<String> routes = [
    '/home',
    '/learn',
    '/quran',
    '/practice',
    '/progress',
  ];
  final List<String> screenTitles = [
    'Tajweed AI',
    'Learn',
    'Quran',
    'Practice',
    'Progress',
  ];
  final List<String> languages = ['English', 'French', 'Arabic'];
  final selectedLanguage = Observable<String>("English");
  int currentIndex = 0;

  String get screenTitle => screenTitles[currentIndex];

  //!Event caller
  void changeTab(int index) => add(ChangeTabEvent(index));
  void changeLanguage(String? language) => add(ChangeLanguageEvent(language));

  void logout() => add(LogoutEvent());

  MainBloc() : super(MainInitial()) {
    on<ChangeTabEvent>(_onChangeTab);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<LogoutEvent>(_onLogout);
  }

  void _onChangeLanguage(ChangeLanguageEvent event, Emitter<MainStates> emit) {
    selectedLanguage.value = event.language ?? selectedLanguage.value;
  }

  void _onLogout(LogoutEvent event, Emitter<MainStates> emit) {
    // TODO: Logout the user
    emit(MainInitial());
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
