import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/cart_view/cart_controller.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        IconButton(
            onPressed: () {
              // controller.dispose();
              Get.back(result: '');
            },
            icon: Icon(Icons.arrow_back)),
        Text(
          'Cart View',
          style: TextStyle(fontSize: 50, color: AppColors.color10),
        ),
        Obx(() {
          print(controller.count.value);
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.cartList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () async {
                        controller.deleteItem(index);
                      },
                    ),
                    Text(
                      controller.cartList[index].storeProductModel?.title ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.addToCart(
                                controller.cartList[index], false);
                          },
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                        // Text(
                        //   "${storage.getItemCount(controller.cartList[index].productModel!.id!)}",
                        //   style: TextStyle(fontSize: 40),
                        // ),
                        InkWell(
                          onTap: () {
                            controller.addToCart(
                                controller.cartList[index], true);
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
                      color: AppColors.color10,
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
