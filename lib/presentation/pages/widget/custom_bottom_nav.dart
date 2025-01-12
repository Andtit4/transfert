import 'package:flutter/material.dart';
import 'package:transfert/core/theme/app_colors.dart';
import 'package:transfert/presentation/cubit/navigation_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  final NavigationTab currentTab;
  final Function(NavigationTab) onTabSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.currentTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .1,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(35)),
        
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home,
              label: 'Accueil',
              isSelected: currentTab == NavigationTab.home,
              onTap: () => onTabSelected(NavigationTab.home),
            ),
            _buildNavItem(
              icon: Icons.settings,
              label: 'Paramétrage',
              isSelected: currentTab == NavigationTab.settings,
              onTap: () => onTabSelected(NavigationTab.settings),
            ),
            // ... autres onglets
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}