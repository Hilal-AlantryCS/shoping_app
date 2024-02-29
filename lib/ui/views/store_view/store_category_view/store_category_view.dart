// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/home_widgets/store_custom_summery_product.dart';
import 'package:task_P2/ui/views/store_view/store_category_view/store_category_controller.dart';

class StoreCategoryView extends StatelessWidget {
  StoreCategoryController controller = Get.put(StoreCategoryController());

  StoreCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: screenWidth(25),
          start: screenWidth(30),
          end: screenWidth(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: screenWidth(10)),
            ),
            Obx(
              () {
                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenWidth(30),
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.selectedCategory.value = index;
                          index == 0
                              ? controller.getAllProduct()
                              : controller.getProductInCategory(
                                  controller.categories[index]);
                        },
                        child: Obx(
                          () {
                            return Container(
                              padding:
                                  EdgeInsetsDirectional.all(screenWidth(25)),
                              margin: EdgeInsetsDirectional.symmetric(
                                horizontal: screenWidth(100),
                              ),
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                                color:
                                    controller.selectedCategory.value == index
                                        ? Colors.purple
                                        : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedCategory.value == index
                                          ? Colors.purple
                                          : Colors.grey,
                                ),
                              ),
                              child: Text(
                                controller.categories[index],
                                style: TextStyle(
                                  fontSize: screenWidth(18),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Text(
              "Products",
              style: TextStyle(fontSize: screenWidth(10)),
            ),
            SizedBox(height: screenWidth(25)),
            Obx(
              () {
                return Expanded(
                  flex: 5,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: controller.products.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StoreCustomSummeryProduct(
                        storeProductModel: controller.products[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
