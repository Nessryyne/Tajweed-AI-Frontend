part of 'profile_sections.dart';

class LanguageSection extends StatelessWidget {
  final Observable<UserProfile> profileData;
  final Observable<bool> isEditing;
  final InputControl nativeLanguage;
  final void Function() onEditPressed;
  final void Function() onSavePressed;
  final void Function() onCancelPressed;

  const LanguageSection({
    super.key,
    required this.profileData,
    required this.isEditing,
    required this.nativeLanguage,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Language Preferences',
      backgroundColor: AppColors.success.withValues(alpha: 0.05),
      isEditing: isEditing.value,
      onEditPressed: onEditPressed,
      onSavePressed: onSavePressed,
      onCancelPressed: onCancelPressed,
      child: Column(
        children: [
          _NativeLanguageSection(
            isEditing: isEditing.value,
            profileData: profileData,
            nativeLanguage: nativeLanguage,
          ),
        ],
      ),
    );
  }
}

class _NativeLanguageSection extends StatelessWidget {
  final bool isEditing;
  final Observable<UserProfile> profileData;
  final InputControl nativeLanguage;

  const _NativeLanguageSection({
    required this.isEditing,
    required this.profileData,
    required this.nativeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _EditableFieldContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              color: AppColors.success,
              icon: Icons.language_outlined,
              label: 'Native Language',
            ),
            VerticalSpacing(AppMetrics.spacing.xsSm),
            FormInput(
              controller: nativeLanguage.controller,
              focusNode: nativeLanguage.node,
              label: 'Native Language',
              type: FormInputType.normal,
            ),
          ],
        ),
      );
    }

    return InfoItem(
      color: AppColors.success,
      icon: Icons.language_outlined,
      label: 'Native Language',
      value: profileData.value.nativeLanguage,
    );
  }
}
