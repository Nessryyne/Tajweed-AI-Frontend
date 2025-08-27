import 'package:tajweed_ai/src/features/home/export.dart';

import '../../../../../base/screens/exports.dart';
import 'profile_header.dart';
part 'drawer_items.dart';
part 'drawer_sections.dart';

class MainDrawer extends SubWidget<MainBloc> {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Profile Header Section
            ProfileHeader(
              userName: 'John Doe',
              userEmail: 'john.doe@example.com',
            ),
            // Scrollable Content Section
            SingleChildScrollView(
              child: Column(
                children: [
                  const _AccountSection(),
                  const VerticalSpacing(8),
                  PreferencesSection(
                    languages: bloc.languages,
                    selectedLanguage: bloc.selectedLanguage,
                    onLanguageChanged: (value) => bloc.changeLanguage(value),
                  ),
                  const VerticalSpacing(8),
                  const _SupportSection(),
                ],
              ).symmetricPadding(horizontal: 16, vertical: 8),
            ).expanded(),

            _LogoutSection(onTap: bloc.logout),
            const _AppVersionFooter(),
          ],
        ),
      ),
    );
  }
}
