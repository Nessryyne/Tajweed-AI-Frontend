import '../../../../../../base/screens/exports.dart';

class SimpleBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const SimpleBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _BottomNavBarItem(
          index: 0,
          icon: Icons.home_rounded,
          label: 'Home',
          isSelected: selectedIndex == 0,
          onTap: onTap,
        ),
        _BottomNavBarItem(
          index: 1,
          icon: Icons.school_rounded,
          label: 'Learn',
          isSelected: selectedIndex == 1,
          onTap: onTap,
        ),
        _BottomNavBarItem(
          index: 2,
          icon: Icons.auto_stories_rounded,
          label: 'Quran',
          isSelected: selectedIndex == 2,
          onTap: onTap,
        ),
        _BottomNavBarItem(
          index: 3,
          icon: Icons.mic_rounded,
          label: 'Practice',
          isSelected: selectedIndex == 3,
          onTap: onTap,
        ),
        _BottomNavBarItem(
          index: 4,
          icon: Icons.trending_up_rounded,
          label: 'Progress',
          isSelected: selectedIndex == 4,
          onTap: onTap,
        ),
      ],
    ).decorate(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.secondary.withValues(alpha: 0.3),
            AppColors.primaryLight.withValues(alpha: 0.2),
            AppColors.primary.withValues(alpha: 0.05),
            Colors.white,
          ],
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function(int) onTap;

  const _BottomNavBarItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : AppColors.greyRegular,
            ),
          ),
          const VerticalSpacing(4),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: AppStyles.caption.copyWith(
              color: isSelected ? AppColors.primary : AppColors.greyRegular,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
            child: Text(label),
          ),
        ],
      ).resize(height: AppMetrics.scaffold.bottomNavBarHeight),
    ),
  );
}
