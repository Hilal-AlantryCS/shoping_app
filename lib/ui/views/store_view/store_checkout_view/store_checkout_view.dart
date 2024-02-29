// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/store_bottom_navigation_enum.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_store_cart_info_price.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/home_view/store_home_view.dart';

class StoreCheckoutView extends StatelessWidget {
  StoreCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.all(screenWidth(20)),
          child: Column(
            children: [
              Text(
                "Your order placed successfully",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth(10),
                ),
              ),
              SizedBox(height: screenWidth(18)),
              Row(
                children: [
                  Text(
                    "Order NO:         ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.purple,
                      fontSize: screenWidth(22),
                    ),
                  ),
                  Text(
                    "#123910",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: screenWidth(22),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth(20)),
              Row(
                children: [
                  Text(
                    "Items Count:    ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.purple,
                      fontSize: screenWidth(22),
                    ),
                  ),
                  Obx(() {
                    return Text(
                      "${cartService.cartCount}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: screenWidth(22),
                      ),
                    );
                  }),
                ],
              ),
              Obx(
                () {
                  return Container(
                    margin: EdgeInsetsDirectional.symmetric(
                      vertical: screenWidth(15),
                    ),
                    padding: EdgeInsetsDirectional.all(
                      screenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        top: BorderSide(
                          color: Colors.purple.shade300,
                          width: 3,
                        ),
                        bottom: BorderSide(
                          color: Colors.purple.shade300,
                          width: 3,
                        ),
                      ),
                    ),
                    height: screenWidth(1.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomStoreCartInfoPrice(
                          title: "Sub Total:",
                          price: cartService.subTotal.value,
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        CustomStoreCartInfoPrice(
                          title: "Tax:",
                          price: cartService.taxAmount.value,
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        CustomStoreCartInfoPrice(
                          title: "Delivery Fees:",
                          price: cartService.deliveryFees.value,
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        CustomStoreCartInfoPrice(
                          title: "Total:",
                          price: cartService.total.value,
                          titleColor: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  cartService.clearCart();
                  homeController.pageController.jumpToPage(1);
                  homeController.selecte.value = StoreBottomNavigationEnum.HOME;
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: StadiumBorder(),
                  fixedSize: Size(
                    screenWidth(1),
                    screenWidth(7),
                  ),
                ),
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(
                    fontSize: screenWidth(18),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
