import '../../../../../base/screens/exports.dart';
import '../../binding/main_deps.dart';
import '../../vm/bloc/main_bloc.dart';
import '../../vm/states/main_states.dart';
import '../../vm/events/main_events.dart';
import 'widgets/bottom_nav_bar.dart';

class MainScreen extends Feature<MainBloc, MainStates> {
  final Widget? child;

  MainScreen({super.key, this.child})
    : super(
        dependencies: MainDependencies().inject,
        onUpdate: (context, state) {
          if (state is MainNavigationChanged) {
            context.go(state.currentRoute);
          }
        },
      );

  @override
  Widget build(BuildContext context, MainStates state) {
    return Scaffold(body: child, bottomNavigationBar: _BottomNavigationBar());
  }
}

class _BottomNavigationBar extends SubWidget<MainBloc> {
  const _BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) => SimpleBottomNavBar(
    selectedIndex: bloc.currentIndex,
    onTap: bloc.changeTab,
  );
}
