import 'package:equatable/equatable.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

final class Idle extends ForgotPasswordState {}

final class Loading extends ForgotPasswordState {}

final class Success extends ForgotPasswordState {
  final String message;

  const Success(this.message);

  @override
  List<Object?> get props => [message];
}

final class Error extends ForgotPasswordState implements Exception {
  final String message;

  const Error._(this.message);
  factory Error.from(Exception exception) =>
      Error._(exception.toString().replaceAll('Exception: ', ''));

  @override
  List<Object> get props => [message];
}
