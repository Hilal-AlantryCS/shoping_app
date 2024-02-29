import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/views/main_view/main_view_widgets/nav_item.dart';

import '../../../../core/enums/bottom_navigation_enum.dart';

class CustomBottmNavigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;
  const CustomBottmNavigation(
      {super.key, required this.selectedView, required this.onTap});

  @override
  State<CustomBottmNavigation> createState() => _CustomBottmNavigationState();
}

class _CustomBottmNavigationState extends State<CustomBottmNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.HOME, 0);
              },
              icon: Icons.home_outlined,
              isSelected: widget.selectedView == BottomNavigationEnum.HOME),
          NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.FAVORITE, 1);
              },
              icon: Icons.favorite_outline,
              isSelected: widget.selectedView == BottomNavigationEnum.FAVORITE),
          NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.NOTIFICATIONS, 2);
              },
              icon: Icons.notification_add_outlined,
              isSelected:
                  widget.selectedView == BottomNavigationEnum.NOTIFICATIONS),
          NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.SETTINGS, 3);
              },
              icon: Icons.settings_outlined,
              isSelected: widget.selectedView == BottomNavigationEnum.SETTINGS),
        ],
      ),
    );
  }
}
