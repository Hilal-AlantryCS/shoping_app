import 'package:flutter/material.dart';
import 'package:task_P2/core/enums/store_bottom_navigation_enum.dart';
import 'package:task_P2/ui/views/store_view/home_widgets/store_nav_item.dart';

class StoreCustomBottmNavigation extends StatefulWidget {
  final StoreBottomNavigationEnum selectedView;
  final Function(StoreBottomNavigationEnum, int) onTap;

  const StoreCustomBottmNavigation({
    super.key,
    required this.selectedView,
    required this.onTap,
  });

  @override
  State<StoreCustomBottmNavigation> createState() =>
      _StoreCustomBottmNavigationState();
}

class _StoreCustomBottmNavigationState
    extends State<StoreCustomBottmNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsetsDirectional.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StoreNavItem(
              onTap: () {
                widget.onTap(StoreBottomNavigationEnum.PRODUCT, 0);
              },
              iconSvg: "assets/images/svgs/products-svgrepo-com.svg",
              isSelected:
                  widget.selectedView == StoreBottomNavigationEnum.PRODUCT),
          StoreNavItem(
              onTap: () {
                widget.onTap(StoreBottomNavigationEnum.HOME, 1);
              },
              iconSvg: "assets/images/svgs/home-svgrepo-com.svg",
              isSelected:
                  widget.selectedView == StoreBottomNavigationEnum.HOME),
          StoreNavItem(
              budge: true,
              onTap: () {
                widget.onTap(StoreBottomNavigationEnum.CART, 2);
              },
              iconSvg: "assets/images/svgs/cart-svgrepo-com.svg",
              isSelected:
                  widget.selectedView == StoreBottomNavigationEnum.CART),
        ],
      ),
    );
  }
}
