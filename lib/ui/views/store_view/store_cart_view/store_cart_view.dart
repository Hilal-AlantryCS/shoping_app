import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_store_cart_info_price.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/store_checkout_view/store_checkout_view.dart';

class StoreCartView extends StatelessWidget {
  const StoreCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            top: screenWidth(25),
            start: screenWidth(30),
            end: screenWidth(30),
          ),
          child: ListView(
            children: [
              Text(
                "Cart",
                style: TextStyle(fontSize: screenWidth(10)),
              ),
              Obx(() {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartService.cartList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsetsDirectional.all(screenWidth(35)),
                      margin: EdgeInsetsDirectional.symmetric(
                        vertical: screenWidth(35),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(30),
                      ),
                      width: screenWidth(1),
                      height: screenWidth(2),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () {
                                cartService.removeFromCartList(
                                    cartService.cartList[index]);
                              },
                              child: SvgPicture.asset(
                                "assets/images/svgs/delete-left-svgrepo-com.svg",
                                width: screenWidth(14),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Row(
                              children: [
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    cartService.changeQty(
                                      model: cartService.cartList[index],
                                      incress: false,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.purple,
                                  ),
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: screenWidth(21),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${cartService.cartList[index].qty}",
                                  style: TextStyle(fontSize: screenWidth(20)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartService.changeQty(
                                      model: cartService.cartList[index],
                                      incress: true,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.purple,
                                  ),
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: screenWidth(21),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                cartService.cartList[index].storeProductModel!
                                            .image !=
                                        null
                                    ? Image.network(
                                        "${cartService.cartList[index].storeProductModel!.image}",
                                        width: screenWidth(5),
                                        height: screenWidth(2.5),
                                      )
                                    : SizedBox(),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                    start: screenWidth(30),
                                  ),
                                  width: screenWidth(1.8),
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: screenWidth(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${cartService.cartList[index].storeProductModel!.title}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: screenWidth(22),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: screenWidth(25)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Price: ",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple,
                                            ),
                                          ),
                                          Text(
                                            "${cartService.cartList[index].storeProductModel!.price}",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenWidth(25)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total: ",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple,
                                            ),
                                          ),
                                          Text(
                                            "${cartService.cartList[index].totals}",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
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
              ElevatedButton(
                onPressed: () {
                  Get.to(StoreCheckoutView());
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
                  "Placed Order",
                  style: TextStyle(
                    fontSize: screenWidth(18),
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.all(screenWidth(15)),
                alignment: AlignmentDirectional.center,
                child: InkWell(
                  onTap: () {
                    cartService.clearCart();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    child: Text(
                      "Empty Cart",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
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
