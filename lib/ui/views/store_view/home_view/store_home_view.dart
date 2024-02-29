// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/store_cart_view/store_cart_view.dart';
import 'package:task_P2/ui/views/store_view/store_category_view/store_category_view.dart';
import 'package:task_P2/ui/views/store_view/home_view/store_home_controller.dart';
import 'package:task_P2/ui/views/store_view/home_widgets/store_bottom_navigation_bar.dart';
import 'package:task_P2/ui/views/store_view/store_product_view/store_product_view.dart';

class StoreHomeView extends StatelessWidget {
  StoreHomeView({super.key});

  // StoreHomeController controller = Get.put(StoreHomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            bottomNavigationBar: StoreCustomBottmNavigation(
              onTap: (selectedView, index) {
                homeController.selecte.value = selectedView;

                homeController.pageController.jumpToPage(index);
                //! here notify onTap in navitem
              },
              selectedView: homeController.selecte.value,
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: homeController.pageController,
              children: [
                StoreProductView(),
                StoreCategoryView(),
                StoreCartView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
