import '../../../../../base/screens/exports.dart';

class HomeTabContent extends StatelessWidget {
  final int tabIndex;

  const HomeTabContent({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    switch (tabIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildLearnContent();
      case 2:
        return _buildPracticeContent();
      case 3:
        return _buildProgressContent();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64, color: AppColors.primary),
          VerticalSpacing(AppMetrics.spacing.md),
          Text(
            'Welcome to Tajweed AI',
            style: AppStyles.headline1.bold().primary(),
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          Text(
            'Master Qur\'an Recitation with AI Guidance',
            style: AppStyles.subtitle.medium().greyRegular(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLearnContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book, size: 64, color: AppColors.primary),
          VerticalSpacing(AppMetrics.spacing.md),
          Text(
            'Learn Tajweed Rules',
            style: AppStyles.headline1.bold().primary(),
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          Text(
            'Study the rules of proper Qur\'an recitation',
            style: AppStyles.subtitle.medium().greyRegular(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mic, size: 64, color: AppColors.primary),
          VerticalSpacing(AppMetrics.spacing.md),
          Text(
            'Practice Recitation',
            style: AppStyles.headline1.bold().primary(),
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          Text(
            'Practice your recitation with AI feedback',
            style: AppStyles.subtitle.medium().greyRegular(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.trending_up, size: 64, color: AppColors.primary),
          VerticalSpacing(AppMetrics.spacing.md),
          Text(
            'Track Your Progress',
            style: AppStyles.headline1.bold().primary(),
          ),
          VerticalSpacing(AppMetrics.spacing.sm),
          Text(
            'Monitor your learning journey',
            style: AppStyles.subtitle.medium().greyRegular(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
