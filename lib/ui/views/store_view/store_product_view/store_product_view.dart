// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/home_widgets/store_custom_summery_product.dart';
import 'package:task_P2/ui/views/store_view/store_product_view/store_product_controller.dart';

class StoreProductView extends StatelessWidget {
  StoreProductView({super.key});
  StoreProductController controller = Get.put(StoreProductController());

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
              "All Products",
              style: TextStyle(fontSize: screenWidth(10)),
            ),
            TextFormField(
              onChanged: (value) {
                controller.searchByString(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.color9,
                ),
                hintText: "Search ...",
              ),
            ),
            SizedBox(height: screenWidth(25)),
            Obx(
              () {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: controller.searchProducts.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StoreCustomSummeryProduct(
                        storeProductModel: controller.searchProducts[index],
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
