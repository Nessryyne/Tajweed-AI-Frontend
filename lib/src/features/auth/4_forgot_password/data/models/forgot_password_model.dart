import 'package:generic_requester/generic_requester.dart';

final class ForgotPasswordModelResponse extends ModelingProtocol {
  final bool success;
  final String info;
  final String token;
  final String? error;

  ForgotPasswordModelResponse({
    required this.success,
    required this.info,
    required this.token,
    this.error,
  });

  factory ForgotPasswordModelResponse.empty() => ForgotPasswordModelResponse(
    success: false,
    info: '',
    token: '',
    error: null,
  );

  @override
  fromJson(json) {
    return ForgotPasswordModelResponse(
      success: json?['success'] ?? false,
      info: json?['info'] ?? '',
      token: json?['data']?['token'] ?? '',
      error: json?['error'],
    );
  }

  @override
  List<Object?> get props => [success, info, token, error];
}
