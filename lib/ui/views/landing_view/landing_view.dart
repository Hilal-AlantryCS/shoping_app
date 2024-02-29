import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:task_P2/core/data/models/token_info.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/core/translation/app_translation.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_elavated_buttom.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/landing_view/landing_controller.dart';
import 'package:task_P2/ui/views/main_view/main_view.dart';
import 'package:task_P2/ui/views/map_view/map_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    LandingController controller = Get.put(LandingController());
    return storage.getLogedIn()
        ? MainView(tokenInfo: TokenInfo(token: ''))
        : SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/pngs/main_background.png',
                      width: screenWidth(1),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: screenWidth(8.5),
                    left: screenWidth(5.2),
                    child: Image.asset(
                      'assets/images/pngs/logo.png',
                      width: screenWidth(1.8),
                    ),
                  ),
                  Positioned(
                      bottom: screenWidth(15),
                      left: screenWidth(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(height: size.width / 0.614),
                          MyElevatedButton(
                            onPressed: () async {
                              //  controller.login();

                              LocationData? locationData = await locationService
                                  .getCurrentLocation(showLoader: true);

                              if (locationData != null) {
                                print(locationData);

                                print(locationService
                                    .getLocationInfo(locationData));

                                Get.to(MapView(myLocation: locationData));
                              }
                            },
                            child: Center(
                              child: CustomText(
                                text: tr('key_login'),
                                styleType: TextStyleType.PX14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                top: screenWidth(25)),
                            child: MyElevatedButton(
                              backgroundColor: AppColors.color3,
                              onPressed: () {
                                controller.signUp();
                              },
                              child: Center(
                                child: CustomText(
                                    text: tr('key_sign_up'),
                                    styleType: TextStyleType.PX14,
                                    textColor: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
  }
}
