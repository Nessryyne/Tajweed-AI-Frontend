import 'package:easy_localization/easy_localization.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../l10n/locale_keys.g.dart';
import '../../../../base/datasource/exports.dart';
import '../data/enums/social_login_enum.dart';
import '../data/models/sign_in_model.dart';

part 'mock/sign_in_mock.dart';

abstract interface class SignInDataSource {
  static const String endpoint = "auth/login/";
  static const String socialLoginEndpoint = "auth/social-login/";

  /// Calls the Sign In API endpoints.
  FutureRequestResult<SignInModelResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Calls the Social Login API endpoints.
  FutureRequestResult<SignInModelResponse> socialLogin(
    SocialLoginSource source,
  );

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

  @override
  FutureRequestResult<SignInModelResponse> socialLogin(
    SocialLoginSource source,
  ) async {
    if (!connectivityMonitor.isConnected)
      return Left(Exception(LocaleKeys.auth_no_internet_connection.tr()));

    try {
      return await performDecodingRequest(
        decodableModel: SignInModelResponse.empty(),
        method: RestfulMethods.post,
        body: {
          "provider": source.name,
          "token": await _getSocialLogiinToken(source),
          "nonce": "",
        },
        path: SignInDataSource.socialLoginEndpoint,
        contentType: "application/json",
        mockingData: _mockSocialLogin(),
        mockIt: false,
      );
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['info'] ?? LocaleKeys.auth_unknown_server_error.tr())
          : e.message ?? LocaleKeys.auth_unknown_dio_error.tr();

      switch (errorMessage) {
        case "SOCIAL_LOGIN_FAILED":
          return Left(Exception("Social login failed"));
        case "INVALID_SOCIAL_TOKEN":
          return Left(Exception("Invalid social token"));
        case "SOCIAL_ACCOUNT_NOT_FOUND":
          return Left(Exception("Social account not found"));
        default:
          return Left(Exception(errorMessage));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<String> _getSocialLogiinToken(SocialLoginSource source) async {
    switch (source) {
      case SocialLoginSource.google:
        return await _getGoogleSignInToken();

      case SocialLoginSource.facebook:
        // TODO: Implement Facebook Sign-In
        // Example: return await FacebookAuth.instance.login().then((result) => result.accessToken?.token ?? '');
        throw UnimplementedError('Facebook Sign-In not implemented yet');

      case SocialLoginSource.apple:
        // TODO: Implement Apple Sign-In
        // Example: return await SignInWithApple.getAppleIDCredential().then((credential) => credential.identityToken ?? '');
        throw UnimplementedError('Apple Sign-In not implemented yet');
    }
  }

  /// Handles Google Sign-In and returns the access token
  Future<String> _getGoogleSignInToken() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;

      // Initialize Google Sign-In
      await signIn.initialize(
        clientId:
            '835828636219-dss0rs24rc6tg5q8q2vck86eua7hn501.apps.googleusercontent.com', // Replace with your actual client ID
        serverClientId:
            '835828636219-dss0rs24rc6tg5q8q2vck86eua7hn501.apps.googleusercontent.com', // Replace with your server client ID
      );

      Debugger.red('Attempting to authenticate');

      // Try to authenticate directly
      GoogleSignInAccount? currentUser = await signIn.authenticate();

      Debugger.green('Authenticated');

      // Request authorization for required scopes
      const List<String> scopes = <String>['email', 'profile', 'openid'];

      final GoogleSignInClientAuthorization? authorization = await currentUser
          .authorizationClient
          .authorizationForScopes(scopes);

      if (authorization == null) {
        throw Exception('Failed to get authorization');
      }

      final String? idToken = currentUser.authentication.idToken;
      if (idToken == null) {
        throw Exception('Failed to get access token');
      }

      Debugger.green('Got access token: ${idToken.substring(0, 20)}...');
      return idToken;
    } on Exception catch (e) {
      Debugger.red('Google Sign-In failed: ${e.toString()}');
      throw Exception('Google Sign-In failed: ${e.toString()}');
    }
  }
}
