part of 'main_drawer.dart';

class _AccountSection extends StatelessWidget {
  const _AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'Account', color: AppColors.info),
        _DrawerItemBase(
          icon: Icons.person_outline,
          title: 'Profile Settings',
          subtitle: 'Personal information & settings',
          iconColor: AppColors.info,
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
        VerticalSpacing(AppMetrics.spacing.xs),
        const Divider(),
      ],
    );
  }
}

class PreferencesSection extends StatelessWidget {
  final List<String> languages;
  final Observable<String> selectedLanguage;
  final ValueChanged<String?> onLanguageChanged;
  const PreferencesSection({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'Preferences', color: AppColors.success),
        _NotificationItem(),
        VerticalSpacing(AppMetrics.spacing.xs),
        _ThemeItem(),
        VerticalSpacing(AppMetrics.spacing.xs),
        Observer(
          observes: selectedLanguage,
          builder: (context, value) => _LanguageItem(
            value: value,
            languages: languages,
            onChanged: onLanguageChanged,
          ),
        ),
        VerticalSpacing(AppMetrics.spacing.xs),
        const Divider(),
      ],
    );
  }
}

class _LogoutSection extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: OutlinedLoadingButton(
        title: 'Log Out',
        titleFontSize: 16,
        textColor: AppColors.error,
        borderGradient: LinearGradient(
          colors: [
            AppColors.error.withValues(alpha: 0.4),
            AppColors.greyRegular.withValues(alpha: 0.2),
            AppColors.greyRegular.withValues(alpha: 0.1),
          ],
        ),
        onTap: onTap,
        prefixIcon: Icons.logout,
        prefixIconColor: AppColors.error,
      ),
    );
  }
}

class _AppVersionFooter extends StatelessWidget {
  const _AppVersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        'Tajweed AI v1.0.0',
        style: AppStyles.caption.copyWith(
          color: AppColors.greyRegular.withValues(alpha: 0.6),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _SupportSection extends StatelessWidget {
  const _SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'Support', color: AppColors.warning),
        _HelpItem(),
        _AboutItem(),
      ],
    );
  }
}
