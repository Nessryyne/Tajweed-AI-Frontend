import 'package:generic_requester/generic_requester.dart';

final class SignUpModelResponse extends ModelingProtocol {
  final bool success;
  final String info;

  SignUpModelResponse({required this.success, required this.info});

  factory SignUpModelResponse.empty() =>
      SignUpModelResponse(success: false, info: '');

  @override
  fromJson(json) {
    return SignUpModelResponse(
      success: json?['success'] ?? false,
      info: json?['info'] ?? '',
    );
  }

  @override
  List<Object?> get props => [success, info];
}
