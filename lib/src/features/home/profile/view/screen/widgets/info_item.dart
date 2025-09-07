part of 'profile_items.dart';

class InfoItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final String value;
  final bool isReadOnly;

  const InfoItem({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderSection(
            label: label,
            icon: icon,
            color: color,
            isReadOnly: isReadOnly,
          ),
          const VerticalSpacing(12),
          _ValueSection(value: value),
        ],
      ).decorate(
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
      );
}

class _HeaderSection extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isReadOnly;

  const _HeaderSection({
    required this.label,
    required this.icon,
    required this.color,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ItemTitle(label: label, icon: icon, color: color),
      if (isReadOnly) ...[const HorizontalSpacing(6), _ReadOnlyBadge()],
    ],
  );
}

class _ReadOnlyBadge extends StatelessWidget {
  const _ReadOnlyBadge();

  @override
  Widget build(BuildContext context) =>
      Text(
        'Read Only',
        style: AppStyles.caption.copyWith(
          color: AppColors.greyDark.withValues(alpha: 0.6),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ).decorate(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.greyDark.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
      );
}

class _ValueSection extends StatelessWidget {
  final String value;

  const _ValueSection({required this.value});

  @override
  Widget build(BuildContext context) =>
      Text(
        value,
        style: AppStyles.subtitle.copyWith(
          color: AppColors.greyDark.withValues(alpha: 0.7),
          fontWeight: FontWeight.w500,
          fontSize: 15,
          height: 1.3,
        ),
        softWrap: true,
        overflow: TextOverflow.visible,
      ).decorate(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.greyDark.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.greyDark.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      );
}

