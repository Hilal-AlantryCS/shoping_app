import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/store_bottom_navigation_enum.dart';

class StoreHomeController extends GetxController {
  PageController pageController = PageController(
    initialPage: 1,
  );
  Rx<StoreBottomNavigationEnum> selecte = StoreBottomNavigationEnum.HOME.obs;
}
