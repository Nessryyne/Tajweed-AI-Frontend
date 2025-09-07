import 'package:cg_core_defs/cg_core_defs.dart' show InputControl;
import 'package:country_picker/country_picker.dart';

import '../../../../../base/screens/exports.dart'
    show FormState, GlobalKey, InputControlsListDisposer;

import '../../../../../base/bloc/exports.dart';
import '../../export.dart';

//$ USE CASES
part '../usecases/profile_uc.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  //! Data Sources
  final ProfileDataSource _profileDataSource;

  //! Keys
  final formKey = GlobalKey<FormState>();

  //! Input Controllers
  late final List<InputControl> inputControllers;
  late final InputControl firstName;
  late final InputControl lastName;
  late final InputControl bio;
  late final InputControl nativeLanguage;

  //! Observables
  final genderObs = Observable<String>("Male");
  final birthDateObs = Observable<DateTime>(DateTime(1990, 1, 1));
  final countryObs = Observable<Country>(
    Country(
      phoneCode: "216",
      countryCode: "TN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Tunisia",
      example: "20123456",
      displayName: "Tunisia (TN) [+216]",
      displayNameNoCountryCode: "Tunisia (TN)",
      e164Key: "216-TN-0",
    ),
  );

  //! Edit States
  final isBasicInfoEditing = Observable<bool>(false);
  final isPersonalDetailsEditing = Observable<bool>(false);
  final isLanguageEditing = Observable<bool>(false);

  //! Profile Data
  final profileData = Observable<UserProfile>(UserProfile.empty());

  //! Event Callers
  Future<void> getUserProfile() async => add(const GetUserProfile());
  Future<void> updateUserProfile(UserProfile profile) async =>
      add(UpdateUserProfile(profile));
  void editBasicInfo() => add(const EditBasicInfo());
  void saveBasicInfo() => add(const SaveBasicInfo());
  void cancelBasicInfo() => add(const CancelBasicInfo());
  void editPersonalDetails() => add(const EditPersonalDetails());
  void savePersonalDetails() => add(const SavePersonalDetails());
  void cancelPersonalDetails() => add(const CancelPersonalDetails());
  void editLanguage() => add(const EditLanguage());
  void saveLanguage() => add(const SaveLanguage());
  void cancelLanguage() => add(const CancelLanguage());

  ProfileBloc(this._profileDataSource) : super(Idle(), debugginEnabled: true) {
    on<GetUserProfile>(_getUserProfile);
    on<UpdateUserProfile>(_updateUserProfile);
    on<EditBasicInfo>(_editBasicInfo);
    on<SaveBasicInfo>(_saveBasicInfo);
    on<CancelBasicInfo>(_cancelBasicInfo);
    on<EditPersonalDetails>(_editPersonalDetails);
    on<SavePersonalDetails>(_savePersonalDetails);
    on<CancelPersonalDetails>(_cancelPersonalDetails);
    on<EditLanguage>(_editLanguage);
    on<SaveLanguage>(_saveLanguage);
    on<CancelLanguage>(_cancelLanguage);
  }

  //@ LIFECYCLE
  @override
  void onInit() {
    inputControllers = InputControl.generate(4);
    firstName = inputControllers[0];
    lastName = inputControllers[1];
    bio = inputControllers[2];
    nativeLanguage = inputControllers[3];
    super.onInit();
  }

  @override
  void onDispose() {
    inputControllers.disposeAll();
    super.onDispose();
  }
}
