import '../../../../app/binding/app_bindings.dart';
import '../vm/bloc/main_bloc.dart';

class MainDependencies {
  void inject() {
    di.registerInstance<MainBloc>(MainBloc());
  }
}
