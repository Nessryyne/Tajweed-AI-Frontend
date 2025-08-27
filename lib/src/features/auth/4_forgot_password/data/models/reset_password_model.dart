import 'package:generic_requester/generic_requester.dart';

final class ResetPasswordModelResponse extends ModelingProtocol {
  final bool success;
  final String info;

  ResetPasswordModelResponse({required this.success, required this.info});

  factory ResetPasswordModelResponse.empty() =>
      ResetPasswordModelResponse(success: false, info: '');

  @override
  fromJson(json) {
    return ResetPasswordModelResponse(
      success: json?['success'] ?? false,
      info: json?['info'] ?? '',
    );
  }

  @override
  List<Object?> get props => [success, info];
}
