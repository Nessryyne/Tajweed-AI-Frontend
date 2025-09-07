part of '../bloc/profile_bloc.dart';

//- Get User Profile
extension on ProfileBloc {
  Future<void> _getUserProfile(
    GetUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(Loading());
    return await _profileDataSource.getUserProfile().then(
      (response) => response.fold(
        (exception) => _handleProfileFailure(exception, emit),
        (data) => _handleProfileSuccess(data, emit),
      ),
    );
  }

  Future<void> _updateUserProfile(
    UpdateUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(Loading());
    return await _profileDataSource
        .updateUserProfile(event.profile)
        .then(
          (response) => response.fold(
            (exception) => _handleProfileFailure(exception, emit),
            (data) => _handleUpdateSuccess(data, emit),
          ),
        );
  }

  //- Basic Info Events
  void _editBasicInfo(EditBasicInfo event, Emitter<ProfileState> emit) {
    isBasicInfoEditing.value = true;
    emit(Idle());
  }

  void _saveBasicInfo(SaveBasicInfo event, Emitter<ProfileState> emit) {
    isBasicInfoEditing.value = false;
    emit(Success('Basic information updated'));
  }

  void _cancelBasicInfo(CancelBasicInfo event, Emitter<ProfileState> emit) {
    isBasicInfoEditing.value = false;
    emit(Idle());
  }

  //- Personal Details Events
  void _editPersonalDetails(
    EditPersonalDetails event,
    Emitter<ProfileState> emit,
  ) {
    isPersonalDetailsEditing.value = true;
    emit(Idle());
  }

  void _savePersonalDetails(
    SavePersonalDetails event,
    Emitter<ProfileState> emit,
  ) {
    isPersonalDetailsEditing.value = false;
    emit(Success('Personal details updated'));
  }

  void _cancelPersonalDetails(
    CancelPersonalDetails event,
    Emitter<ProfileState> emit,
  ) {
    isPersonalDetailsEditing.value = false;
    emit(Idle());
  }

  //- Language Events
  void _editLanguage(EditLanguage event, Emitter<ProfileState> emit) {
    isLanguageEditing.value = true;
    emit(Idle());
  }

  void _saveLanguage(SaveLanguage event, Emitter<ProfileState> emit) {
    isLanguageEditing.value = false;
    emit(Success('Language preferences updated'));
  }

  void _cancelLanguage(CancelLanguage event, Emitter<ProfileState> emit) {
    isLanguageEditing.value = false;
    emit(Idle());
  }

  Future<void> _handleProfileSuccess(
    UserProfile data,
    Emitter<ProfileState> emit,
  ) async {
    profileData.value = data;
    emit(Success('Profile loaded successfully'));
  }

  Future<void> _handleUpdateSuccess(
    UserProfile data,
    Emitter<ProfileState> emit,
  ) async {
    emit(Success('Profile updated successfully'));
  }
}

void _handleProfileFailure(Exception exception, Emitter<ProfileState> emit) =>
    emit(Error.from(exception));
