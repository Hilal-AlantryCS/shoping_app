import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/splash_view/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //!   Navigator.push => Get.to(LandingView());
  //?    Navigator.pushReplacement  => Get.off(LandingView());
  //*     Navigator.pushAndRemoveUntil  => Get.offAll(LandingView());
  //todo    Navigator.pop  => Get.back();

  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            Center(
                child: Image.asset(
              'assets/images/pngs/logo.png',
              width: screenWidth(1.8),
            ))
          ],
        ),
      ),
    );
  }
}
