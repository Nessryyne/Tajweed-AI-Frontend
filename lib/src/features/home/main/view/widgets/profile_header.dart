import '../../../../../base/screens/exports.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: AppStyles.headline2.bold().copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(userEmail, style: AppStyles.caption.greyRegular()),
        ],
      ).decorate(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: AppMetrics.drawer.horizontalPadding,
          right: AppMetrics.drawer.horizontalPadding,
          top: AppMetrics.drawer.topPadding,
          bottom: AppMetrics.drawer.verticalPadding,
        ),
      );
}
