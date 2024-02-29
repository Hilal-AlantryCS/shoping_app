import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_profile_icon.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/landing_view/landing_view.dart';
import 'package:task_P2/ui/views/main_view/main_view_widgets/side_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.2),
      color: AppColors.color3,
      child: Column(
        children: [
          SizedBox(
            height: screenWidth(20),
          ),
          Center(
            child: Container(
              width: screenWidth(2.6),
              child: Stack(
                children: [
                  Positioned(
                    right: screenWidth(80),
                    top: screenWidth(45),
                    child: CustomProfileIcon(
                      hw: 8,
                      backgroundColor: AppColors.color8,
                    ),
                  ),
                  Positioned(
                      bottom: screenWidth(30),
                      left: screenWidth(23),
                      child: CustomProfileIcon(hw: 18)),
                  Container(
                    child: Center(
                      child: CustomProfileIcon(
                          hw: 3, assetImg: 'assets/images/pngs/ic_malek.jpg'),
                    ),
                  ),
                  Positioned(
                      top: screenWidth(35),
                      left: screenWidth(16),
                      child: CustomProfileIcon(hw: 30)),
                  Positioned(
                      right: 0,
                      top: screenWidth(8.8),
                      child: CustomProfileIcon(
                        hw: 16,
                        gradientColor: AppColors.gradientColorTransparent,
                      )),
                ],
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(35), bottom: screenWidth(10)),
            child: Column(
              children: [
                CustomText(
                  text: 'Malek',
                  styleType: TextStyleType.PX20,
                  textColor: AppColors.color9,
                ),
                CustomText(
                  text: 'Malek@gmail.com',
                  styleType: TextStyleType.PX12,
                  textColor: AppColors.color6,
                )
              ],
            ),
          )),
          Container(
            width: screenWidth(1),
            height: screenWidth(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SideItem(svgIcName: 'ic_home', title: 'Home', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_categories',
                    title: 'Categories',
                    onTap: () {}),
                SideItem(
                    svgIcName: 'ic_orders', title: 'My orders', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_heart', title: 'Wish list', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_settings', title: 'Settings', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_bell', title: 'Notifications', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_faq',
                    title: 'Help & FAQ',
                    needClose: true,
                    onTap: () {}),
                SideItem(
                    svgIcName: 'ic_logout',
                    title: 'Logout',
                    w: screenWidth(14),
                    onTap: () {
                      storage.setLogedIn(false);
                      Get.off(LandingView());
                      ;
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
