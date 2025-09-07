part of 'profile_sections.dart';

class PersonalDetailsSection extends StatelessWidget {
  final Observable<UserProfile> profileData;
  final Observable<bool> isEditing;
  final Observable<String> genderObs;
  final Observable<DateTime> birthDateObs;
  final Observable<Country> countryObs;
  final void Function() onEditPressed;
  final void Function() onSavePressed;
  final void Function() onCancelPressed;

  const PersonalDetailsSection({
    super.key,
    required this.profileData,
    required this.isEditing,
    required this.genderObs,
    required this.birthDateObs,
    required this.countryObs,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Personal Details',
      backgroundColor: AppColors.warning.withValues(alpha: 0.05),
      isEditing: isEditing.value,
      onEditPressed: onEditPressed,
      onSavePressed: onSavePressed,
      onCancelPressed: onCancelPressed,
      child: Column(
        children: [
          _GenderSection(isEditing: isEditing.value, genderObs: genderObs),
          const VerticalSpacing(16),
          _BirthdaySection(
            isEditing: isEditing.value,
            birthDateObs: birthDateObs,
            profileData: profileData,
          ),
          const VerticalSpacing(16),
          _CountrySection(
            isEditing: isEditing.value,
            countryObs: countryObs,
            profileData: profileData,
          ),
        ],
      ),
    );
  }
}

class _GenderSection extends StatelessWidget {
  final bool isEditing;
  final Observable<String> genderObs;

  const _GenderSection({required this.isEditing, required this.genderObs});

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _EditableFieldContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              color: AppColors.warning,
              icon: Icons.person_outline,
              label: 'Gender',
            ),
            const VerticalSpacing(12),
            DropdownButtonFormField<String>(
              value: genderObs.value,
              onChanged: (value) => genderObs.value = value!,
              items: ['Male', 'Female'].map((gender) {
                return DropdownMenuItem(value: gender, child: Text(gender));
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return InfoItem(
      color: AppColors.warning,
      icon: Icons.person_outline,
      label: 'Gender',
      value: genderObs.value,
    );
  }
}

class _BirthdaySection extends StatelessWidget {
  final bool isEditing;
  final Observable<DateTime> birthDateObs;
  final Observable<UserProfile> profileData;

  const _BirthdaySection({
    required this.isEditing,
    required this.birthDateObs,
    required this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _EditableFieldContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              color: AppColors.warning,
              icon: Icons.cake_outlined,
              label: 'Birthday',
            ),
            const VerticalSpacing(12),
            BirthFieldPicker(
              selectedBirthdayObs: birthDateObs,
              onDateSelected: (date) => birthDateObs.value = date,
              date: birthDateObs.value,
            ),
          ],
        ),
      );
    }

    return InfoItem(
      color: AppColors.warning,
      icon: Icons.cake_outlined,
      label: 'Birthday',
      value: profileData.value.birthday,
    );
  }
}

class _CountrySection extends StatelessWidget {
  final bool isEditing;
  final Observable<Country> countryObs;
  final Observable<UserProfile> profileData;

  const _CountrySection({
    required this.isEditing,
    required this.countryObs,
    required this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _EditableFieldContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              color: AppColors.warning,
              icon: Icons.location_on_outlined,
              label: 'Country',
            ),
            const VerticalSpacing(12),
            CountryFieldPicker(
              onCountrySelected: (country) => countryObs.value = country,
              country: countryObs.value,
            ),
          ],
        ),
      );
    }

    return InfoItem(
      color: AppColors.warning,
      icon: Icons.location_on_outlined,
      label: 'Country',
      value: profileData.value.country,
    );
  }
}
