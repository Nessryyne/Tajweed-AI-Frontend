part of 'main_drawer.dart';

class _AccountSection extends StatelessWidget {
  final VoidCallback onTap;
  const _AccountSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(
          title: LocaleKeys.drawer_account.tr(),
          color: AppColors.info,
        ),
        _DrawerItemBase(
          icon: Icons.person_outline,
          title: LocaleKeys.drawer_profile_settings.tr(),
          subtitle: LocaleKeys.drawer_profile_settings_subtitle.tr(),
          iconColor: AppColors.info,
          trailing: const _CommonTrailing(),
        ),
        VerticalSpacing(AppMetrics.spacing.xs),
        const Divider(),
      ],
    ).onTap(onTap);
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
        _SectionHeader(
          title: LocaleKeys.drawer_preferences.tr(),
          color: AppColors.success,
        ),
        _NotificationItem(),
        VerticalSpacing(AppMetrics.spacing.xs),
        _ThemeItem(),
        VerticalSpacing(AppMetrics.spacing.xs),
        _LanguageItem(
          value: selectedLanguage,
          languages: languages,
          onChanged: onLanguageChanged,
        ),
        VerticalSpacing(AppMetrics.spacing.xs),
        const Divider(),
      ],
    );
  }
}

class _LogoutSection extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  const _LogoutSection({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: OutlinedLoadingButton(
        title: LocaleKeys.drawer_logout.tr(),
        isLoading: isLoading,
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
        '${LocaleKeys.app_name.tr()} v1.0.0',
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
        _SectionHeader(
          title: LocaleKeys.drawer_support.tr(),
          color: AppColors.warning,
        ),
        _HelpItem(),
        _AboutItem(),
      ],
    );
  }
}
