import '../../../../../../base/screens/exports.dart';

import 'package:country_picker/country_picker.dart';

import '../../../../../auth/3_sign_up/view/widgets/birth_field_picker.dart';
import '../../../../../auth/3_sign_up/view/widgets/country_field_picker.dart';
import '../../../../../auth/3_sign_up/view/widgets/sign_up_form.dart';
import '../../../../../common/widgets/form_input.dart';
import 'profile_items.dart';

class EditableFieldContainer extends StatelessWidget {
  final Widget child;

  const EditableFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class BasicInfoSection extends StatefulWidget {
  const BasicInfoSection({super.key});

  @override
  State<BasicInfoSection> createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  // Mock profile data
  final Map<String, dynamic> profileData = {
    'id': 0,
    'email': 'user@example.com',
    'first_name': 'John',
    'last_name': 'Doe',
    'bio': 'Learning Tajweed and improving my Quran recitation skills.',
  };

  // Edit mode states
  bool isBasicInfoEditing = false;

  // Controllers for edit mode
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    firstNameController = TextEditingController(
      text: profileData['first_name'],
    );
    lastNameController = TextEditingController(text: profileData['last_name']);
    bioController = TextEditingController(text: profileData['bio']);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Basic Information',
      backgroundColor: AppColors.info.withValues(alpha: 0.05),
      isEditing: isBasicInfoEditing,
      onEditPressed: () =>
          setState(() => isBasicInfoEditing = !isBasicInfoEditing),
      onSavePressed: () {
        setState(() {
          profileData['first_name'] = firstNameController.text;
          profileData['last_name'] = lastNameController.text;
          profileData['bio'] = bioController.text;
          isBasicInfoEditing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Basic information updated')));
      },
      onCancelPressed: () {
        setState(() {
          firstNameController.text = profileData['first_name'];
          lastNameController.text = profileData['last_name'];
          bioController.text = profileData['bio'];
          isBasicInfoEditing = false;
        });
      },
      child: Column(
        children: [
          // Email (read-only)
          InfoItem(
            color: AppColors.info,
            icon: Icons.email_outlined,
            label: 'Email',
            value: profileData['email'],
            isReadOnly: true,
          ),
          VerticalSpacing(AppMetrics.spacing.lgSm),

          // Full Name
          if (isBasicInfoEditing) ...[
            Column(
              children: [
                EditableFieldContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      ItemTitle(
                        color: AppColors.primary,
                        icon: Icons.person_outline,
                        label: 'First Name',
                      ),
                      const VerticalSpacing(12),
                      FormInput(
                        controller: firstNameController,
                        label: 'First Name',
                        type: FormInputType.normal,
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(16),
                EditableFieldContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      ItemTitle(
                        color: AppColors.primary,
                        icon: Icons.person_outline,
                        label: 'Last Name',
                      ),
                      const VerticalSpacing(12),
                      FormInput(
                        controller: lastNameController,
                        label: 'Last Name',
                        type: FormInputType.normal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ] else ...[
            InfoItem(
              color: AppColors.primary,
              icon: Icons.person_2_outlined,
              label: 'Full Name',
              value: '${profileData['first_name']} ${profileData['last_name']}',
            ),
          ],
          const VerticalSpacing(16),

          // Bio
          if (isBasicInfoEditing) ...[
            EditableFieldContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 16,
                        color: Colors.white,
                      ).decorate(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const HorizontalSpacing(8),
                      Text(
                        'Bio',
                        style: AppStyles.subtitle.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  FormInput(
                    controller: bioController,
                    label: 'Bio',
                    type: FormInputType.normal,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ] else ...[
            InfoItem(
              color: AppColors.success,
              icon: Icons.description_outlined,
              label: 'Bio',
              value: profileData['bio'],
            ),
          ],
        ],
      ),
    );
  }
}

class PersonalDetailsSection extends StatefulWidget {
  const PersonalDetailsSection({super.key});

  @override
  State<PersonalDetailsSection> createState() => _PersonalDetailsSectionState();
}

class _PersonalDetailsSectionState extends State<PersonalDetailsSection> {
  // Mock profile data
  final Map<String, dynamic> profileData = {
    'birthday': '1990-01-01',
    'gender': 'M',
    'country': 'Tunisia',
    'country_code': 'TN',
  };

  // Edit mode states
  bool isPersonalDetailsEditing = false;

  // Observables for form components
  late Observable<String> selectedGenderObs;
  late Observable<DateTime> selectedBirthdayObs;
  late Observable<Country> selectedCountryObs;

  @override
  void initState() {
    super.initState();
    // Initialize observables
    selectedGenderObs = Observable<String>(profileData['gender']);
    selectedBirthdayObs = Observable<DateTime>(
      DateTime.parse(profileData['birthday']),
    );
    selectedCountryObs = Observable<Country>(
      Country(
        phoneCode: "216",
        countryCode: profileData['country_code'],
        e164Sc: 0,
        geographic: true,
        level: 1,
        name: profileData['country'],
        example: "20123456",
        displayName:
            "${profileData['country']} (${profileData['country_code']}) [+216]",
        displayNameNoCountryCode:
            "${profileData['country']} (${profileData['country_code']})",
        e164Key: "216-${profileData['country_code']}-0",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Personal Details',
      backgroundColor: AppColors.success.withValues(alpha: 0.1),
      isEditing: isPersonalDetailsEditing,
      onEditPressed: () =>
          setState(() => isPersonalDetailsEditing = !isPersonalDetailsEditing),
      onSavePressed: () {
        setState(() {
          profileData['birthday'] = selectedBirthdayObs.value
              .toIso8601String()
              .split('T')[0];
          profileData['gender'] = selectedGenderObs.value;
          profileData['country'] = selectedCountryObs.value.name;
          profileData['country_code'] = selectedCountryObs.value.countryCode;
          isPersonalDetailsEditing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Personal details updated')));
      },
      onCancelPressed: () {
        setState(() {
          selectedBirthdayObs.value = DateTime.parse(profileData['birthday']);
          selectedGenderObs.value = profileData['gender'];
          selectedCountryObs.value = Country(
            phoneCode: "216",
            countryCode: profileData['country_code'],
            e164Sc: 0,
            geographic: true,
            level: 1,
            name: profileData['country'],
            example: "20123456",
            displayName:
                "${profileData['country']} (${profileData['country_code']}) [+216]",
            displayNameNoCountryCode:
                "${profileData['country']} (${profileData['country_code']})",
            e164Key: "216-${profileData['country_code']}-0",
          );
          isPersonalDetailsEditing = false;
        });
      },
      child: Column(
        children: [
          // Birthday
          if (isPersonalDetailsEditing) ...[
            EditableFieldContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warning,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.cake_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const HorizontalSpacing(8),
                      Text(
                        'Birthday',
                        style: AppStyles.subtitle.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  Observer(
                    observes: selectedBirthdayObs,
                    builder: (context, _) => BirthFieldPicker(
                      onDateSelected: (date) {
                        selectedBirthdayObs.value = date;
                      },
                      date: selectedBirthdayObs.value,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            InfoItem(
              color: AppColors.warning,
              icon: Icons.cake_outlined,
              label: 'Birthday',
              value: profileData['birthday'],
              isReadOnly: false,
            ),
          ],
          const VerticalSpacing(12),

          // Gender
          if (isPersonalDetailsEditing) ...[
            EditableFieldContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.wc_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const HorizontalSpacing(8),
                      Text(
                        'Gender',
                        style: AppStyles.subtitle.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  Observer(
                    observes: selectedGenderObs,
                    builder: (context, _) => OptionSelector<Gender>(
                      options: Gender.values,
                      selectedValue: selectedGenderObs.value == "M"
                          ? Gender.male
                          : selectedGenderObs.value == "F"
                          ? Gender.female
                          : null,
                      labelBuilder: (g) => g.label,
                      onChanged: (value) {
                        selectedGenderObs.value = value.code;
                      },
                      title: 'Gender',
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            InfoItem(
              color: AppColors.error,
              icon: Icons.wc_outlined,
              label: 'Gender',
              value: selectedGenderObs.value == 'M' ? 'Male' : 'Female',
              isReadOnly: false,
            ),
          ],
          const VerticalSpacing(12),

          // Country
          if (isPersonalDetailsEditing) ...[
            EditableFieldContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const HorizontalSpacing(8),
                      Text(
                        'Country',
                        style: AppStyles.subtitle.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  Observer(
                    observes: selectedCountryObs,
                    builder: (context, _) => CountryFieldPicker(
                      onCountrySelected: (country) {
                        selectedCountryObs.value = country;
                      },
                      country: selectedCountryObs.value,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            InfoItem(
              color: AppColors.accent,
              icon: Icons.location_on_outlined,
              label: 'Country',
              value: profileData['country'],
              isReadOnly: false,
            ),
          ],
        ],
      ),
    );
  }
}

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  // Mock profile data
  final Map<String, dynamic> profileData = {'native_language': 'Arabic'};

  // Edit mode states
  bool isLanguageEditing = false;

  // Controllers for edit mode
  late TextEditingController nativeLanguageController;

  @override
  void initState() {
    super.initState();
    nativeLanguageController = TextEditingController(
      text: profileData['native_language'],
    );
  }

  @override
  void dispose() {
    nativeLanguageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Language',
      backgroundColor: AppColors.warning.withValues(alpha: 0.1),
      isEditing: isLanguageEditing,
      onEditPressed: () =>
          setState(() => isLanguageEditing = !isLanguageEditing),
      onSavePressed: () {
        setState(() {
          profileData['native_language'] = nativeLanguageController.text;
          isLanguageEditing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Language updated')));
      },
      onCancelPressed: () {
        setState(() {
          nativeLanguageController.text = profileData['native_language'];
          isLanguageEditing = false;
        });
      },
      child: Column(
        children: [
          // Native Language
          if (isLanguageEditing) ...[
            EditableFieldContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.info,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.language_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const HorizontalSpacing(8),
                      Text(
                        'Native Language',
                        style: AppStyles.subtitle.copyWith(
                          color: AppColors.info,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  FormInput(
                    controller: nativeLanguageController,
                    label: 'Native Language',
                    type: FormInputType.normal,
                  ),
                ],
              ),
            ),
          ] else ...[
            InfoItem(
              color: AppColors.info,
              icon: Icons.language_outlined,
              label: 'Native Language',
              value: profileData['native_language'],
              isReadOnly: false,
            ),
          ],
        ],
      ),
    );
  }
}

class SectionBuilder extends StatelessWidget {
  final String title;
  final bool isEditing;
  final VoidCallback onEditPressed;
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;
  final Widget child;
  final Color? backgroundColor;

  const SectionBuilder({
    super.key,
    required this.title,
    required this.isEditing,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppMetrics.spacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor ?? AppColors.secondary.withValues(alpha: 0.05),
            (backgroundColor ?? AppColors.secondary.withValues(alpha: 0.05))
                .withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // Main shadow for depth
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 25,
            offset: Offset(0, 12),
            spreadRadius: 0,
          ),
          // Secondary shadow for more depth
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
          // Inner highlight for 3D effect
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.9),
            blurRadius: 1,
            offset: Offset(0, -1),
            spreadRadius: 0,
          ),
          // Top highlight for 3D effect
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.6),
            blurRadius: 2,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header with Edit Button
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getSectionColor(title),
                        _getSectionColor(title).withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: _getSectionColor(title).withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getSectionIcon(title),
                        color: Colors.white,
                        size: 20,
                      ),
                      const HorizontalSpacing(8),
                      Expanded(
                        child: Text(
                          title,
                          style: AppStyles.headline3.bold().copyWith(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HorizontalSpacing(12),
              if (!isEditing)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: _getSectionColor(title).withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: onEditPressed,
                    icon: Icon(
                      Icons.edit_outlined,
                      color: _getSectionColor(title),
                      size: 20,
                    ),
                    padding: EdgeInsets.all(8),
                    constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                  ),
                ),
            ],
          ),
          const VerticalSpacing(20),
          child,
          // Action buttons at the bottom when editing
          if (isEditing) ...[
            const VerticalSpacing(20),
            Row(
              children: [
                OutlinedLoadingButton(
                  onTap: onCancelPressed,
                  title: 'Cancel',
                  titleFontSize: 14,
                  textColor: AppColors.error,
                  backgroundColor: AppColors.error.withValues(alpha: 0.1),
                  borderGradient: LinearGradient(
                    colors: [
                      AppColors.error,
                      AppColors.error.withValues(alpha: 0.8),
                    ],
                  ),
                  height: 40,
                ).expanded(),

                const HorizontalSpacing(12),
                LoadingButton(
                  onTap: onSavePressed,
                  title: 'Save',
                  titleFontSize: 14,
                  backgroundColor: AppColors.success,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.success,
                      AppColors.success.withValues(alpha: 0.8),
                    ],
                  ),
                  height: 40,
                ).expanded(),
              ],
            ),
          ],
        ],
      ),
    );
  }

  IconData _getSectionIcon(String title) {
    switch (title.toLowerCase()) {
      case 'basic information':
        return Icons.person_outline;
      case 'personal details':
        return Icons.favorite_outline;
      case 'language':
        return Icons.language_outlined;
      default:
        return Icons.info_outline;
    }
  }

  Color _getSectionColor(String title) {
    final lowerTitle = title.toLowerCase();
    if (lowerTitle.contains('basic information')) return AppColors.info;
    if (lowerTitle.contains('personal details')) return AppColors.success;
    if (lowerTitle.contains('language')) return AppColors.warning;
    return AppColors.primary;
  }
}
