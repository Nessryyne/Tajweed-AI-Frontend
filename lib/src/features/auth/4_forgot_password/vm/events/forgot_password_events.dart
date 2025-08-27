import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class RequestResetCode extends ForgotPasswordEvent {
  final String email;

  const RequestResetCode(this.email);

  @override
  List<Object?> get props => [email];
}

class VerifyResetCode extends ForgotPasswordEvent {
  final String email;
  final String code;

  const VerifyResetCode({required this.email, required this.code});

  @override
  List<Object?> get props => [email, code];
}

class ResetPassword extends ForgotPasswordEvent {
  final String token;
  final String newPassword;

  const ResetPassword({required this.token, required this.newPassword});

  @override
  List<Object?> get props => [token, newPassword];
}

class ResendPin extends ForgotPasswordEvent {
  final String email;
  const ResendPin(this.email);
  @override
  List<Object?> get props => [email];
}

class NextStep extends ForgotPasswordEvent {
  final int current;

  const NextStep(this.current);

  @override
  List<Object?> get props => [current];
}

class PreviousStep extends ForgotPasswordEvent {
  final int current;

  const PreviousStep(this.current);

  @override
  List<Object?> get props => [current];
}
