import '../../../../../base/screens/exports.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Progress',
          style: AppStyles.headline2.bold().primary(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppMetrics.scaffold.horizontalBodyPadding,
          vertical: AppMetrics.scaffold.topBodyPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Track Your Learning',
              style: AppStyles.headline1.bold().primary(),
            ),
            VerticalSpacing(AppMetrics.spacing.sm),
            Text(
              'Monitor your tajweed learning journey',
              style: AppStyles.subtitle.medium().greyRegular(),
            ),
            VerticalSpacing(AppMetrics.spacing.lg),

            // Progress overview
            _buildProgressCard(
              context,
              'Overall Progress',
              '75%',
              Icons.trending_up,
              Colors.green,
              'You\'re doing great! Keep practicing.',
            ),
            VerticalSpacing(AppMetrics.spacing.md),

            // Progress sections
            _buildProgressSection(
              context,
              'Learning Progress',
              'Track your rule mastery',
              Icons.menu_book,
              Colors.blue,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildProgressSection(
              context,
              'Practice Sessions',
              'Review your practice history',
              Icons.mic,
              Colors.orange,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildProgressSection(
              context,
              'Achievements',
              'View your earned badges',
              Icons.emoji_events,
              Colors.yellow,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildProgressSection(
              context,
              'Analytics',
              'Detailed performance insights',
              Icons.bar_chart,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(
    BuildContext context,
    String title,
    String percentage,
    IconData icon,
    Color color,
    String description,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 32),
                HorizontalSpacing(AppMetrics.spacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.title.bold().primary()),
                      Text(
                        description,
                        style: AppStyles.caption.medium().greyRegular(),
                      ),
                    ],
                  ),
                ),
                Text(
                  percentage,
                  style: AppStyles.headline2.bold().copyWith(color: color),
                ),
              ],
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            LinearProgressIndicator(
              value: 0.75,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening $title...')));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              HorizontalSpacing(AppMetrics.spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyles.title.bold().primary()),
                    VerticalSpacing(4),
                    Text(
                      description,
                      style: AppStyles.caption.medium().greyRegular(),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.greyRegular,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
