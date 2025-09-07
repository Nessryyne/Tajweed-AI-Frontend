part of 'profile_sections.dart';

class BasicInfoSection extends StatelessWidget {
  final Observable<UserProfile> profileData;
  final Observable<bool> isEditing;
  final InputControl firstName;
  final InputControl lastName;
  final InputControl bio;
  final void Function() onEditPressed;
  final void Function() onSavePressed;
  final void Function() onCancelPressed;

  const BasicInfoSection({
    super.key,
    required this.profileData,
    required this.isEditing,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Basic Information',
      backgroundColor: AppColors.info.withValues(alpha: 0.05),
      isEditing: isEditing.value,
      onEditPressed: onEditPressed,
      onSavePressed: onSavePressed,
      onCancelPressed: onCancelPressed,
      child: Column(
        children: [
          _EmailItem(profileData: profileData),
          VerticalSpacing(AppMetrics.spacing.lgSm),
          _NameSection(
            isEditing: isEditing.value,
            profileData: profileData,
            firstName: firstName,
            lastName: lastName,
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          _BioSection(
            isEditing: isEditing.value,
            profileData: profileData,
            bio: bio,
          ),
        ],
      ),
    );
  }
}

class _EmailItem extends StatelessWidget {
  final Observable<UserProfile> profileData;

  const _EmailItem({required this.profileData});

  @override
  Widget build(BuildContext context) => InfoItem(
    color: AppColors.info,
    icon: Icons.email_outlined,
    label: 'Email',
    value: profileData.value.email,
    isReadOnly: true,
  );
}

class _NameSection extends StatelessWidget {
  final bool isEditing;
  final Observable<UserProfile> profileData;
  final InputControl firstName;
  final InputControl lastName;

  const _NameSection({
    required this.isEditing,
    required this.profileData,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return Column(
        children: [
          _EditableFieldContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemTitle(
                  color: AppColors.primary,
                  icon: Icons.person_outline,
                  label: 'First Name',
                ),
                VerticalSpacing(AppMetrics.spacing.sm),
                FormInput(
                  controller: firstName.controller,
                  focusNode: firstName.node,
                  label: 'First Name',
                  type: FormInputType.normal,
                ),
              ],
            ),
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          _EditableFieldContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemTitle(
                  color: AppColors.primary,
                  icon: Icons.person_outline,
                  label: 'Last Name',
                ),
                const VerticalSpacing(12),
                FormInput(
                  controller: lastName.controller,
                  focusNode: lastName.node,
                  label: 'Last Name',
                  type: FormInputType.normal,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return InfoItem(
      color: AppColors.primary,
      icon: Icons.person_2_outlined,
      label: 'Full Name',
      value: '${profileData.value.firstName} ${profileData.value.lastName}',
    );
  }
}

class _BioSection extends StatelessWidget {
  final bool isEditing;
  final Observable<UserProfile> profileData;
  final InputControl bio;

  const _BioSection({
    required this.isEditing,
    required this.profileData,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _EditableFieldContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              color: AppColors.secondary,
              icon: Icons.description_outlined,
              label: 'Bio',
            ),
            VerticalSpacing(AppMetrics.spacing.sm),
            FormInput(
              controller: bio.controller,
              focusNode: bio.node,
              label: 'Bio',
              type: FormInputType.normal,
              maxLines: 3,
            ),
          ],
        ),
      );
    }

    return InfoItem(
      color: AppColors.secondary,
      icon: Icons.description_outlined,
      label: 'Bio',
      value: profileData.value.bio,
    );
  }
}
