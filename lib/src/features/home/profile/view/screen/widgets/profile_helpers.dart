part of 'profile_sections.dart';

class SectionBuilder extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool isEditing;
  final VoidCallback onEditPressed;
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;
  final Widget child;

  const SectionBuilder({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.isEditing,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.withValues(alpha: 0.1), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: title,
          isEditing: isEditing,
          onEditPressed: onEditPressed,
          onSavePressed: onSavePressed,
          onCancelPressed: onCancelPressed,
        ),
        Padding(padding: EdgeInsets.all(AppMetrics.spacing.md), child: child),
      ],
    ),
  );
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isEditing;
  final VoidCallback onEditPressed;
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;

  const _SectionHeader({
    required this.title,
    required this.isEditing,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(AppMetrics.spacing.md),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.8),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    child: Row(
      children: [
        Text(
          title,
          style: AppStyles.headline3.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyDark,
          ),
        ),
        const Spacer(),
        if (isEditing) ...[
          OutlinedLoadingButton(
            title: 'Cancel',
            titleFontSize: 14,
            textColor: AppColors.greyDark,
            onTap: onCancelPressed,
          ),
          const HorizontalSpacing(8),
          LoadingButton(
            title: 'Save',
            titleFontSize: 14,
            backgroundColor: AppColors.success,
            onTap: onSavePressed,
          ),
        ] else
          OutlinedLoadingButton(
            title: 'Edit',
            titleFontSize: 14,
            textColor: AppColors.primary,
            onTap: onEditPressed,
          ),
      ],
    ),
  );
}

class _EditableFieldContainer extends StatelessWidget {
  final Widget child;

  const _EditableFieldContainer({required this.child});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(AppMetrics.spacing.md),
    decoration: BoxDecoration(
      color: AppColors.greyBackground,
      borderRadius: BorderRadius.circular(AppMetrics.defaultRadius),
      border: Border.all(
        color: AppColors.primary.withValues(alpha: 0.2),
        width: 1,
      ),
    ),
    child: child,
  );
}
