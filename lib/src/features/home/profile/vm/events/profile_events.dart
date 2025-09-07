import 'package:equatable/equatable.dart';

import '../../export.dart' show UserProfile;

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

//- Get User Profile
final class GetUserProfile extends ProfileEvent {
  const GetUserProfile();
}

//- Update User Profile
final class UpdateUserProfile extends ProfileEvent {
  final UserProfile profile;

  const UpdateUserProfile(this.profile);

  @override
  List<Object> get props => [profile];
}

//- Basic Info Events
final class EditBasicInfo extends ProfileEvent {
  const EditBasicInfo();
}

final class SaveBasicInfo extends ProfileEvent {
  const SaveBasicInfo();
}

final class CancelBasicInfo extends ProfileEvent {
  const CancelBasicInfo();
}

//- Personal Details Events
final class EditPersonalDetails extends ProfileEvent {
  const EditPersonalDetails();
}

final class SavePersonalDetails extends ProfileEvent {
  const SavePersonalDetails();
}

final class CancelPersonalDetails extends ProfileEvent {
  const CancelPersonalDetails();
}

//- Language Events
final class EditLanguage extends ProfileEvent {
  const EditLanguage();
}

final class SaveLanguage extends ProfileEvent {
  const SaveLanguage();
}

final class CancelLanguage extends ProfileEvent {
  const CancelLanguage();
}
