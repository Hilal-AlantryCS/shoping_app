import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CustomProfileIcon extends StatelessWidget {
  final double hw;
  final String? urlOfImg;
  final String? assetImg;
  final Color? backgroundColor;
  final List<Color>? gradientColor;
  const CustomProfileIcon(
      {super.key,
      required this.hw,
      this.urlOfImg,
      this.assetImg,
      this.backgroundColor,
      this.gradientColor = AppColors.gradientColor});

  @override
  Widget build(BuildContext context) {
    
    if (assetImg != null && urlOfImg == null) {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(
          color: AppColors.color1,
          border: Border.all(
            width: screenWidth(300),
            color: AppColors.color7,
          ),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImg!),
          ),
        ),
      );
    } else if (assetImg == null && urlOfImg != null) {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(
          border: Border.all(
            width: screenWidth(500),
            color: AppColors.color7,
          ),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urlOfImg!),
          ),
        ),
      );
    } else {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundColor != null
              ? null
              : LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                  colors: gradientColor!),
          borderRadius: BorderRadius.circular(100),
        ),
      );
    }
  }
}
