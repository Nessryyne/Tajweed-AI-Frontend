import 'package:flutter/material.dart';

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
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_rounded, 'Home'),
          _buildNavItem(1, Icons.menu_book_rounded, 'Learn'),
          _buildNavItem(2, Icons.auto_stories_rounded, 'Quran'),
          _buildNavItem(3, Icons.mic_rounded, 'Practice'),
          _buildNavItem(4, Icons.trending_up_rounded, 'Progress'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
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
              const SizedBox(height: 6),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: AppStyles.caption.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.greyRegular,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 10,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Alternative clean design
class CleanBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CleanBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.primary.withOpacity(0.1), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_rounded, 'Home'),
          _buildNavItem(1, Icons.menu_book_rounded, 'Learn'),
          _buildNavItem(2, Icons.auto_stories_rounded, 'Quran'),
          _buildNavItem(3, Icons.mic_rounded, 'Practice'),
          _buildNavItem(4, Icons.trending_up_rounded, 'Progress'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: isSelected
                      ? Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 2,
                        )
                      : null,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isSelected ? Colors.white : AppColors.greyRegular,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppStyles.caption.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.greyRegular,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
