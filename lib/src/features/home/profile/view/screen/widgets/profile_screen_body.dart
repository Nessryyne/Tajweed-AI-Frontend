import '../../../../../../base/screens/exports.dart';
import 'profile_sections.dart';

//? Bloc needed imports
import '../../../vm/bloc/profile_bloc.dart';

class ProfileScreenBody extends SubWidget<ProfileBloc> {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppMetrics.spacing.lg),
      child: Column(
        children: [
          // Basic Information Section
          BasicInfoSection(
            profileData: bloc.profileData,
            isEditing: bloc.isBasicInfoEditing,
            firstName: bloc.firstName,
            lastName: bloc.lastName,
            bio: bloc.bio,
            onEditPressed: bloc.editBasicInfo,
            onSavePressed: bloc.saveBasicInfo,
            onCancelPressed: bloc.cancelBasicInfo,
          ),
          VerticalSpacing(AppMetrics.spacing.lgSm),

          // Personal Details Section
          PersonalDetailsSection(
            profileData: bloc.profileData,
            isEditing: bloc.isPersonalDetailsEditing,
            genderObs: bloc.genderObs,
            birthDateObs: bloc.birthDateObs,
            countryObs: bloc.countryObs,
            onEditPressed: bloc.editPersonalDetails,
            onSavePressed: bloc.savePersonalDetails,
            onCancelPressed: bloc.cancelPersonalDetails,
          ),
          VerticalSpacing(AppMetrics.spacing.lgSm),

          // Language Section
          LanguageSection(
            profileData: bloc.profileData,
            isEditing: bloc.isLanguageEditing,
            nativeLanguage: bloc.nativeLanguage,
            onEditPressed: bloc.editLanguage,
            onSavePressed: bloc.saveLanguage,
            onCancelPressed: bloc.cancelLanguage,
          ),
        ],
      ),
    );
  }
}
