part of 'main_drawer.dart';

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color? color;
  const _SectionHeader({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        title,
        style: AppStyles.subtitle.bold().copyWith(
          color: color ?? AppColors.primary,
        ),
      ),
      const Spacer(),
    ],
  ).symmetricPadding(vertical: 8, horizontal: 4);
}

class _DrawerItemBase extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final Widget trailing;

  const _DrawerItemBase({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    required this.trailing,
  });
  @override
  Widget build(BuildContext context) =>
      Row(
        children: [
          Icon(
                icon,
                size: AppMetrics.drawer.verticalPadding,
                color: iconColor ?? AppColors.primary,
              )
              .decorate(
                width: AppMetrics.drawer.topPadding,
                height: AppMetrics.drawer.topPadding,
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.primary).withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
              .decorate(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: (iconColor ?? AppColors.primary).withValues(
                      alpha: 0.3,
                    ),
                    width: 2,
                  ),
                ),
              ),

          HorizontalSpacing(AppMetrics.spacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.subtitle.medium().copyWith(
                  color: AppColors.greyRegular,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: AppStyles.caption.copyWith(
                  color: AppColors.greyRegular.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ).expanded(),

          trailing,
        ],
      ).decorate(
        height: AppMetrics.spacing.largeItemHeight,
        padding: EdgeInsets.symmetric(
          horizontal: AppMetrics.spacing.sm,
          vertical: AppMetrics.spacing.xs + 4,
        ),
      );
}

class _SwitchItem extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SwitchItem({super.key, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) => Switch(
    value: value,
    onChanged: onChanged,
    // ignore: deprecated_member_use
    activeColor: AppColors.success,
    activeTrackColor: AppColors.success.withValues(alpha: 0.2),
    inactiveThumbColor: AppColors.greyRegular.withValues(alpha: 0.3),
    inactiveTrackColor: AppColors.greyRegular.withValues(alpha: 0.1),
  );
}

class _CommonTrailing extends StatelessWidget {
  const _CommonTrailing({super.key});
  @override
  Widget build(BuildContext context) => Icon(
    Icons.arrow_forward_ios,
    size: AppMetrics.drawer.horizontalPadding,
    color: AppColors.greyRegular.withValues(alpha: 0.3),
  );
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({super.key});
  @override
  Widget build(BuildContext context) {
    return _DrawerItemBase(
      icon: Icons.notifications_outlined,
      title: LocaleKeys.drawer_notifications.tr(),
      subtitle: LocaleKeys.drawer_notifications_subtitle.tr(),
      iconColor: AppColors.success,
      trailing: Transform.scale(
        scale: 0.8,
        child: _SwitchItem(value: true, onChanged: (value) {}),
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  const _ThemeItem({super.key});
  @override
  Widget build(BuildContext context) => _DrawerItemBase(
    icon: Icons.dark_mode_outlined,
    title: LocaleKeys.drawer_theme.tr(),
    subtitle: LocaleKeys.drawer_theme_subtitle.tr(),
    iconColor: AppColors.success,
    trailing: Transform.scale(
      scale: 0.8,
      child: _SwitchItem(value: false, onChanged: (value) {}),
    ),
  );
}

class _LanguageItem extends StatelessWidget {
  final Observable<String> value;
  final List<String> languages;
  final ValueChanged<String?> onChanged;
  const _LanguageItem({
    super.key,
    required this.value,
    required this.languages,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) => _DrawerItemBase(
    icon: Icons.language_outlined,
    title: LocaleKeys.drawer_language.tr(),
    subtitle: value.value,
    iconColor: AppColors.success,
    trailing: Transform.scale(
      scale: 0.8,
      child: Observer(
        observes: value,
        builder: (context, v) => DropdownButton<String>(
          value: v,
          isDense: true,
          underline: const SizedBox.shrink(),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.success.withValues(alpha: 0.7),
          ),
          style: AppStyles.caption.semiBold().copyWith(
            color: AppColors.success,
          ),
          dropdownColor: AppColors.success.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(AppMetrics.defaultRadius),
          items: languages.map((lang) {
            return DropdownMenuItem(
              value: lang,
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 16,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    lang,
                    style: AppStyles.caption.semiBold().copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}

class _HelpItem extends StatelessWidget {
  const _HelpItem({super.key});
  @override
  Widget build(BuildContext context) => _DrawerItemBase(
    icon: Icons.help_outline,
    title: LocaleKeys.drawer_help.tr(),
    subtitle: LocaleKeys.drawer_help_subtitle.tr(),
    iconColor: AppColors.warning,
    trailing: const _CommonTrailing(),
  );
}

class _AboutItem extends StatelessWidget {
  const _AboutItem({super.key});
  @override
  Widget build(BuildContext context) => _DrawerItemBase(
    icon: Icons.info_outline,
    title: LocaleKeys.drawer_about.tr(),
    subtitle: LocaleKeys.drawer_about_subtitle.tr(),
    iconColor: AppColors.warning,
    trailing: const _CommonTrailing(),
  );
}
