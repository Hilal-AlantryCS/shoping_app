import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class StoreNavItem extends StatelessWidget {
  final String iconSvg;
  final bool isSelected;
  final Function onTap;
  final bool budge;

  StoreNavItem({
    super.key,
    required this.iconSvg,
    required this.isSelected,
    required this.onTap,
    this.budge = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: AppColors.color1,
                    width: 4,
                  ),
                )
              : null,
        ),
        width: screenWidth(7),
        height: screenWidth(7),
        child: Stack(
          children: [
            Container(
              width: screenWidth(10),
              height: screenWidth(10),
              child: SvgPicture.asset(
                iconSvg,
                color: isSelected ? Colors.purple : Colors.black,
                width: screenWidth(11),
                height: screenWidth(11),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: budge
                  ? Container(
                      width: screenWidth(20),
                      height: screenWidth(20),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Obx(() {
                        return Text(
                          "${cartService.cartCount.value}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
