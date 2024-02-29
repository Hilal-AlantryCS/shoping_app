import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  NavItem(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: isSelected
                ? Border(bottom: BorderSide(color: AppColors.color1, width: 4))
                : null),
        child: Icon(
          icon,
          size: screenWidth(8),
          color: isSelected ? AppColors.color1 : AppColors.color3,
        ),
      ),
    );
  }
}
