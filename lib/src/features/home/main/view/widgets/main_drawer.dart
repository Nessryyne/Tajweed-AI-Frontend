import 'package:tajweed_ai/src/features/home/export.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../base/screens/exports.dart';
import 'profile_header.dart';
part 'drawer_items.dart';
part 'drawer_sections.dart';

class MainDrawer extends SubWidget<MainBloc> {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Profile Header Section
          ProfileHeader(userName: bloc.userName, userEmail: bloc.userEmail),
          // Scrollable Content Section
          SingleChildScrollView(
            child: Column(
              children: [
                _AccountSection(onTap: bloc.changeToProfileSettings),
                const VerticalSpacing(8),
                PreferencesSection(
                  languages: bloc.languages,
                  selectedLanguage: bloc.selectedLanguage,
                  onLanguageChanged: (value) => bloc.changeLanguage(value),
                ),
                const VerticalSpacing(8),
                _SupportSection(),
              ],
            ).symmetricPadding(horizontal: 16, vertical: 8),
          ).expanded(),

          _LogoutSection(
            onTap: bloc.logout,
            isLoading: bloc.state is LogoutLoading,
          ),
          const _AppVersionFooter(),
        ],
      ).decorate(color: Colors.white),
    );
  }
}
