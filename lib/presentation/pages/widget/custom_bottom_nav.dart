import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.history,
                index: 1,
              ),
              // Espace pour le bouton central
              const SizedBox(width: 60),
              _buildNavItem(
                icon: Icons.monetization_on,
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                index: 4,
              ),
            ],
          ),
          // Bouton central surélevé
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => onItemSelected(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    
    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        width: 50,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}