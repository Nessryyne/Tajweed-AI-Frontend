import 'package:equatable/equatable.dart';

import '../../data/models/profile_model.dart';

sealed class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class Idle extends ProfileState {}

final class Loading extends ProfileState {}

final class Success extends ProfileState {
  final String message;

  Success(this.message);

  @override
  List<Object> get props => [message];
}

final class Error extends ProfileState implements Exception {
  final String message;

  Error._(this.message);
  factory Error.from(Exception exception) =>
      Error._(exception.toString().replaceAll('Exception: ', ''));

  @override
  List<Object> get props => [message];
}

final class ProfileLoaded extends ProfileState {
  final UserProfile profile;

  ProfileLoaded(this.profile);

  @override
  List<Object> get props => [profile];
}

final class ProfileEditing extends ProfileState {
  final UserProfile profile;

  ProfileEditing(this.profile);

  @override
  List<Object> get props => [profile];
}
