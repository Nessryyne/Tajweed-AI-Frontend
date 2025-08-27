import '../../../../../base/bloc/base_bloc.dart';
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
  int currentIndex = 0;

  String get screenTitle => screenTitles[currentIndex];

  //!Event caller
  void changeTab(int index) => add(ChangeTabEvent(index));

  MainBloc() : super(MainInitial()) {
    on<ChangeTabEvent>(_onChangeTab);
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
