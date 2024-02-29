import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/repository/products-repository.dart';
import 'package:task_P2/core/services/cart_service.dart';
import 'package:task_P2/core/services/location_service.dart';
import 'package:task_P2/ui/views/store_view/home_view/store_home_controller.dart';
import '../../core/data/repository/shared_prefrence_repository.dart';
import '../../core/services/connectivity_service.dart';
import 'colors.dart';

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 103, 103).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color: AppColors.color8,
          size: screenWidth(8),
        ),
      );
    });

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isComplexPassword(String password) {
  RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
  );
  return regex.hasMatch(password);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}

void changeLanguage(String code) {
  storage.setAppLanguage(code);
  Get.updateLocale(getLocal());
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
LocationService get locationService => Get.find<LocationService>();
Connectivity get connectivity => Get.find<Connectivity>();
ProductRepository get productRepository => Get.find<ProductRepository>();
CartService get cartService => Get.find<CartService>();
StoreHomeController get homeController => Get.find<StoreHomeController>();

bool isOnline = true;
