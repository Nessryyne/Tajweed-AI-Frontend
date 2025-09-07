import '../../../../base/dependencies/dependencies.dart';
import '../datasource/profile_datasource.dart';
import '../vm/bloc/profile_bloc.dart';

class ProfileDependencies implements Dependencies {
  @override
  void inject() {
    //$ Data sources
    di.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(
        client: get(),
        cacheManager: get(),
        connectivityMonitor: get(),
      ),
    );

    di.registerInstance<ProfileBloc>(ProfileBloc(get()));
  }
}
