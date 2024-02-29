import 'package:flutter/material.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class TobContainer extends StatelessWidget {
  final String text;
  final IconData? iconArrowForward;
  final bool isimageball;
  const TobContainer({
    super.key,
    required this.text,
    this.iconArrowForward,
    required this.isimageball,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      height: screenWidth(3.4),
      decoration: BoxDecoration(
          color: AppColors.color1,
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(25),
              bottomStart: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/pngs/ball.png',
                  width: screenWidth(7.5),
                ),
                CustomText(
                  text: text,
                  styleType: TextStyleType.PX16,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: screenWidth(25)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(12)),
              child: Row(
                children: [
                  isimageball
                      ? Image.asset(
                          'assets/images/pngs/ball.png',
                          width: screenWidth(8.5),
                        )
                      : Container(
                          width: screenWidth(7),
                          height: screenWidth(7),
                          color: AppColors.color6,
                        ),
                  Icon(
                    iconArrowForward,
                    size: screenWidth(15),
                    color: AppColors.color3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
