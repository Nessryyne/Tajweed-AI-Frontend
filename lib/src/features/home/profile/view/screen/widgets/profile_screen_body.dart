import '../../../../../../base/screens/exports.dart';
import 'profile_sections.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppMetrics.spacing.lg),
      child: Column(
        children: [
          // Basic Information Section
          BasicInfoSection(),
          const VerticalSpacing(20),

          // Personal Details Section
          PersonalDetailsSection(),
          const VerticalSpacing(20),

          // Language Section
          LanguageSection(),
        ],
      ),
    );
  }
}
