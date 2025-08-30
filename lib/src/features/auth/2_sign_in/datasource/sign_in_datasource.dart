import 'package:easy_localization/easy_localization.dart';

import '../../../../../l10n/locale_keys.g.dart';
import '../../../../base/datasource/exports.dart';
import '../data/models/sign_in_model.dart';

part 'mock/sign_in_mock.dart';

abstract interface class SignInDataSource {
  static const String endpoint = "auth/login/";

  /// Calls the Sign In API endpoints.
  FutureRequestResult<SignInModelResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Calls the Sign In API endpoints.
  FutureRequestResult<SignInModelResponse> signInWithGoogle();

  /// Calls the Sign In API endpoints.
  FutureRequestResult<SignInModelResponse> signInWithFacebook();
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
}

final class SignInDataSourceImpl extends DataSource
    implements SignInDataSource {
  SignInDataSourceImpl({
    required super.client,
    required super.cacheManager,
    required super.connectivityMonitor,
  });

  @override
  FutureRequestResult<SignInModelResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (!connectivityMonitor.isConnected)
      return Left(Exception(LocaleKeys.auth_no_internet_connection.tr()));
    try {
      return await performDecodingRequest(
        decodableModel: SignInModelResponse.empty(),
        method: RestfulMethods.post,
        body: {"email": email, "password": password},
        path: SignInDataSource.endpoint,
        contentType: "application/json",
        mockingData: _mockSignInWithEmailAndPassword(),
        mockIt: false,
      );
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['info'] ?? LocaleKeys.auth_unknown_server_error.tr())
          : e.message ?? LocaleKeys.auth_unknown_dio_error.tr();
      if (errorMessage == "LOGIN_FAILED") {
        return Left(Exception(LocaleKeys.auth_invalid_credentials.tr()));
      }
      return Left(Exception(errorMessage));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  FutureRequestResult<SignInModelResponse> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  FutureRequestResult<SignInModelResponse> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final secureCache = cacheManager as CacheManagerImpl;
    await secureCache.setSecureString('access_token', accessToken);
    Debugger.red(accessToken);
    await secureCache.setSecureString('refresh_token', refreshToken);
    Debugger.green(accessToken);
  }
}
