import '../../../../base/dependencies/dependencies.dart';
import '../datasource/forgot_password_datasource.dart';
import '../vm/bloc/forgot_password_bloc.dart';

class ForgotPasswordDependencies implements Dependencies {
  @override
  void inject() {
    // Data sources
    di.registerLazySingleton<ForgotPasswordDataSource>(
      () => ForgotPasswordDataSourceImpl(
        client: get(),
        cacheManager: get(),
        connectivityMonitor: get(),
      ),
    );

    // Bloc
    di.registerInstance(ForgotPasswordBloc(get()));
  }
}
