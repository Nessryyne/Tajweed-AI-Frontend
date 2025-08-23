import 'package:generic_requester/generic_requester.dart';
import '../../../3_sign_up/data/models/activate_account_response.dart';

final class SignInModelResponse extends ModelingProtocol {
  final bool success;
  final String message;
  final TokenData? data;
  final String? error;

  SignInModelResponse({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory SignInModelResponse.empty() =>
      SignInModelResponse(success: false, message: '');

  @override
  fromJson(json) {
    final isSuccess = json?['success'] ?? false;
    final message = json?['info'] ?? 'Unknown response';

    if (isSuccess && json?['data'] != null) {
      // Success response - tokens are in data object
      return SignInModelResponse(
        success: true,
        message: message,
        data: TokenData.fromJson(json['data']),
      );
    } else {
      // Error response - has error field
      return SignInModelResponse(
        success: false,
        message: message,
        error: json?['error'],
      );
    }
  }

  @override
  List<Object?> get props => [success, message, data, error];
}
