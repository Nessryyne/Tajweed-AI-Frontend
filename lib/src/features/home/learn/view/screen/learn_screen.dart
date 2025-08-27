import 'package:flutter/material.dart';

import '../../../../../base/screens/exports.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Tajweed',
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
            Text('Tajweed Rules', style: AppStyles.headline1.bold().primary()),
            VerticalSpacing(AppMetrics.spacing.sm),
            Text(
              'Master the rules of proper Qur\'an recitation',
              style: AppStyles.subtitle.medium().greyRegular(),
            ),
            VerticalSpacing(AppMetrics.spacing.lg),

            // Learning categories
            _buildLearningCategory(
              context,
              'Basic Rules',
              'Learn fundamental tajweed rules',
              Icons.abc,
              Colors.blue,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildLearningCategory(
              context,
              'Advanced Rules',
              'Master complex tajweed principles',
              Icons.school,
              Colors.green,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildLearningCategory(
              context,
              'Practical Examples',
              'See rules in action with examples',
              Icons.play_circle,
              Colors.orange,
            ),
            VerticalSpacing(AppMetrics.spacing.md),
            _buildLearningCategory(
              context,
              'Quiz & Tests',
              'Test your knowledge',
              Icons.quiz,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningCategory(
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
          // Navigate to specific learning category
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


