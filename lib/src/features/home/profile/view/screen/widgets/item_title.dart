part of 'profile_items.dart';

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
      _IconContainer(icon: icon, color: color),
      const HorizontalSpacing(8),
      _LabelText(label: label, color: color),
    ],
  );
}

class _IconContainer extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _IconContainer({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) =>
      Icon(icon, size: 16, color: Colors.white).decorate(
        padding: EdgeInsets.symmetric(
          horizontal: AppMetrics.spacing.xs,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
      );
}

class _LabelText extends StatelessWidget {
  final String label;
  final Color color;

  const _LabelText({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Text(
    label,
    style: AppStyles.subtitle.copyWith(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
  );
}

