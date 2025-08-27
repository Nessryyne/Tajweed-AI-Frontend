import '../../../../../base/screens/exports.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.home,
                label: 'Home',
                isSelected: currentIndex == 0,
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.menu_book,
                label: 'Learn',
                isSelected: currentIndex == 1,
              ),
              _buildNavItem(
                index: 2,
                icon: Icons.mic,
                label: 'Practice',
                isSelected: currentIndex == 2,
              ),
              _buildNavItem(
                index: 3,
                icon: Icons.trending_up,
                label: 'Progress',
                isSelected: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final color = isSelected ? AppColors.primary : AppColors.greyRegular;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            VerticalSpacing(4),
            Text(
              label,
              style: AppStyles.caption.medium().copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
