import '../../../../app/binding/app_bindings.dart';
import '../datasource/main_datasource.dart';
import '../vm/bloc/main_bloc.dart';

class MainDependencies {
  void inject() {
    di.registerLazySingleton<MainDataSource>(
      () => MainDataSourceImpl(
        client: get(),
        cacheManager: get(),
        connectivityMonitor: get(),
      ),
    );
    di.registerInstance<MainBloc>(MainBloc(get()));
  }
}
