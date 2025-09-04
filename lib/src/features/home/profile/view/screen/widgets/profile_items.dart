import 'package:tajweed_ai/src/base/screens/exports.dart';

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
          // Modern label with icon
          Row(
            children: [
              ItemTitle(label: label, icon: icon, color: color),
              if (isReadOnly) ...[
                const HorizontalSpacing(6),

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
                ),
              ],
            ],
          ),
          const VerticalSpacing(12),

          // Value with better styling
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
          ),
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

class ItemTitle extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const ItemTitle({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 16, color: Colors.white).decorate(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
      ),

      const HorizontalSpacing(8),
      Text(
        label,
        style: AppStyles.subtitle.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    ],
  );
}
