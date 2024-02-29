// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/store_product_details_view/store_product_details_controller.dart';

class StoreProductDetailView extends StatelessWidget {
  StoreProductDetailsController controller =
      Get.put(StoreProductDetailsController());
  final StoreProductModel storeProductModel;
  StoreProductDetailView({
    super.key,
    required this.storeProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: screenWidth(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(40),
              topEnd: Radius.circular(40),
            ),
            color: Color.fromARGB(255, 231, 231, 231),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  cartService.addToCart(
                    model: storeProductModel,
                    qty: controller.qty.value,
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    screenWidth(3),
                    screenWidth(10),
                  ),
                  shape: StadiumBorder(),
                  backgroundColor: Colors.purple,
                ),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: screenWidth(23),
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.decresqty();
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
                  Obx(() {
                    return Text(
                      "${controller.qty.value}",
                      style: TextStyle(fontSize: screenWidth(20)),
                    );
                  }),
                  ElevatedButton(
                    onPressed: () {
                      controller.incresqty();
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
              )
            ],
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.all(
            screenWidth(20),
          ),
          children: [
            Text(
              storeProductModel.title ?? "",
              style: TextStyle(
                fontSize: screenWidth(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: screenWidth(20),
                horizontal: screenWidth(9),
              ),
              child: Image.network(
                storeProductModel.image ?? "",
                fit: BoxFit.fitWidth,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description:",
                  style: TextStyle(
                    fontSize: screenWidth(20),
                    fontWeight: FontWeight.w600,
                    color: Colors.purple,
                  ),
                ),
                RatingBar.builder(
                  itemCount: 5,
                  direction: Axis.horizontal,
                  itemSize: screenWidth(20),
                  allowHalfRating: true,
                  minRating: 1,
                  initialRating: storeProductModel.rating != null
                      ? storeProductModel.rating!.rate ?? 0.0
                      : 0.0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.purple,
                  ),
                  onRatingUpdate: (value) {
                    print(value);
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: screenWidth(20),
                bottom: screenWidth(10),
              ),
              child: Text(
                storeProductModel.description ?? "",
                style: TextStyle(
                  fontSize: screenWidth(22),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Category: ",
                  style: TextStyle(
                    fontSize: screenWidth(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  storeProductModel.category ?? "",
                  style: TextStyle(
                    fontSize: screenWidth(20),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: screenWidth(10),
                bottom: screenWidth(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    "${storeProductModel.price}",
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
