import '../../../../base/datasource/exports.dart';
import '../data/models/forgot_password_model.dart';
import '../data/models/reset_password_model.dart';

part 'mock/forgot_password_mock.dart';

abstract interface class ForgotPasswordDataSource {
  static const String forgotPasswordEndpoint = "auth/forget-password/";
  static const String verifyCodeEndpoint = "auth/verif-password-code/";
  static const String resetPasswordEndpoint = "auth/reset-password/";

  /// Step 1: Request password reset code
  FutureRequestResult<ForgotPasswordModelResponse> requestResetCode({
    required String email,
  });

  /// Step 2: Verify reset code
  FutureRequestResult<ForgotPasswordModelResponse> verifyResetCode({
    required String email,
    required String code,
  });

  /// Step 3: Reset password with new password
  FutureRequestResult<ResetPasswordModelResponse> resetPassword({
    required String token,
    required String newPassword,
  });
}

final class ForgotPasswordDataSourceImpl extends DataSource
    implements ForgotPasswordDataSource {
  ForgotPasswordDataSourceImpl({
    required super.client,
    required super.cacheManager,
    required super.connectivityMonitor,
  });

  @override
  FutureRequestResult<ForgotPasswordModelResponse> requestResetCode({
    required String email,
  }) async {
    if (!connectivityMonitor.isConnected)
      return Left(Exception('No internet connection'));
    try {
      return await performDecodingRequest(
        decodableModel: ForgotPasswordModelResponse.empty(),
        method: RestfulMethods.post,
        body: {"email": email},
        path: ForgotPasswordDataSource.forgotPasswordEndpoint,
        mockingData: _mockRequestResetCodeSuccess(),
        mockIt: false,
      );
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['info'] ?? "Unknown server error")
          : e.message ?? "Unknown Dio error";
      if (errorMessage == "RESET_FAILED") {
        return Left(Exception("This email is not registered"));
      }
      return Left(Exception(errorMessage));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  FutureRequestResult<ForgotPasswordModelResponse> verifyResetCode({
    required String email,
    required String code,
  }) async {
    if (!connectivityMonitor.isConnected)
      return Left(Exception('No internet connection'));
    try {
      return await performDecodingRequest(
        decodableModel: ForgotPasswordModelResponse.empty(),
        method: RestfulMethods.post,
        body: {"email": email, "code": code},
        path: ForgotPasswordDataSource.verifyCodeEndpoint,
        mockingData: _mockVerifyCodeSuccess(),
        mockIt: false,
      );
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['info'] ?? "Unknown server error")
          : e.message ?? "Unknown Dio error";
      if (errorMessage == "INVALID_CODE") {
        return Left(Exception("Code is invalid"));
      } else if (errorMessage == "EXPIRED_CODE") {
        return Left(Exception("Code is expired"));
      }
      return Left(Exception(errorMessage));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  FutureRequestResult<ResetPasswordModelResponse> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    if (!connectivityMonitor.isConnected)
      return Left(Exception('No internet connection'));
    try {
      return await performDecodingRequest(
        decodableModel: ResetPasswordModelResponse.empty(),
        method: RestfulMethods.post,
        body: {"token": token, "newPassword": newPassword},
        path: ForgotPasswordDataSource.resetPasswordEndpoint,
        mockingData: _mockResetPasswordSuccess(),
        mockIt: false,
      );
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['info'] ?? "Unknown server error")
          : e.message ?? "Unknown Dio error";
      return Left(Exception(errorMessage));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
