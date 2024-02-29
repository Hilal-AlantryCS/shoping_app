import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/cart_model.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/cart_view/cart_view.dart';
import 'package:task_P2/ui/views/main_view/prodcuts_view/products_controller.dart';

class PorductsView extends StatelessWidget {
  PorductsView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController controller = Get.put(ProductsController());
    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag,
          ),
          onPressed: () async {
            Get.to(CartView())!.then((value) {
              controller.count.value = value;
            });
          },
        ),
        Text(
          'Products View',
          style: TextStyle(fontSize: 50, color: AppColors.color10),
        ),
        Obx(() {
          print(controller.count.value);
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Text(
                      controller.productList[index].title ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.addToCart(
                                CartModel(
                                    qty: 1,
                                    storeProductModel:
                                        controller.productList[index],
                                    totals:
                                        controller.productList[index].price),
                                false);
                          },
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                        // Text(
                        //   "${storage.getItemCount(controller.productList[index].id!)}",
                        //   style: TextStyle(fontSize: 40),
                        // ),
                        InkWell(
                          onTap: () {
                            controller.addToCart(
                                CartModel(
                                    qty: 1,
                                    storeProductModel:
                                        controller.productList[index],
                                    totals:
                                        controller.productList[index].price),
                                true);
                          },
                          child: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.color1,
                    )
                  ],
                ),
              );
            },
          );
        }),
      ]),
    ));
  }
}
