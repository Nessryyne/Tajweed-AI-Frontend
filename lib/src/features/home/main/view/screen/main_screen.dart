import '../../../../../base/screens/exports.dart';
import '../../binding/main_deps.dart';
import '../../vm/bloc/main_bloc.dart';
import '../../vm/states/main_states.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/main_drawer.dart';

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
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: Text(bloc.screenTitle)),
      body: child,
      bottomNavigationBar: SimpleBottomNavBar(
        selectedIndex: bloc.currentIndex,
        onTap: bloc.changeTab,
      ),
    );
  }
}
