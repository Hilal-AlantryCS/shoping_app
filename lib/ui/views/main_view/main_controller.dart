import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/enums/bottom_navigation_enum.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  Rx<BottomNavigationEnum> selecte = BottomNavigationEnum.HOME.obs;

  // GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
}
