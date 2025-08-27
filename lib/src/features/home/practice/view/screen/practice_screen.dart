import 'package:flutter/material.dart';

import '../../../../../base/screens/exports.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Practice Recitation',
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
              'Practice Your Recitation',
              style: AppStyles.headline1.bold().primary(),
            ),
            VerticalSpacing(AppMetrics.spacing.sm),
            Text(
              'Improve your tajweed with AI feedback',
              style: AppStyles.subtitle.medium().greyRegular(),
            ),
            VerticalSpacing(AppMetrics.spacing.lg),

            // Practice options
            _buildPracticeOption(
              context,
              'Record New Recitation',
              'Start a new practice session',
              Icons.mic,
              Colors.red,
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Starting recording...')),
                );
              },
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildPracticeOption(
              context,
              'Practice Specific Rules',
              'Focus on particular tajweed rules',
              Icons.track_changes,
              Colors.blue,
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening rule selection...')),
                );
              },
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildPracticeOption(
              context,
              'Review Previous Sessions',
              'See your past practice recordings',
              Icons.history,
              Colors.green,
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Loading history...')),
                );
              },
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildPracticeOption(
              context,
              'AI Feedback Analysis',
              'Get detailed feedback on your recitation',
              Icons.analytics,
              Colors.purple,
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Analyzing recitation...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
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


