import '../../../../../base/screens/exports.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String photoUrl;
  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) =>
      Row(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: ClipOval(
              child: Image.network(
                photoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: 30, color: Colors.white);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ).decorate(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.8),
                width: 2,
              ),
            ),
          ),

          HorizontalSpacing(AppMetrics.spacing.sm),
          // User Information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName,
                style: AppStyles.headline2.bold().copyWith(color: Colors.white),
              ),
              const SizedBox(height: 2),
              Text(userEmail, style: AppStyles.caption.greyRegular()),
            ],
          ).expanded(),
        ],
      ).decorate(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: AppMetrics.drawer.horizontalPadding,
          right: AppMetrics.drawer.horizontalPadding,
          top: AppMetrics.drawer.topPadding,
          bottom: AppMetrics.drawer.verticalPadding,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.9),
              AppColors.primary.withValues(alpha: 0.7),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      );
}
