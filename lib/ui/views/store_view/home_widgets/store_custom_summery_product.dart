import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/store_product_details_view/store_product_details_view.dart';

class StoreCustomSummeryProduct extends StatelessWidget {
  final StoreProductModel storeProductModel;
  const StoreCustomSummeryProduct({
    super.key,
    required this.storeProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => StoreProductDetailView(
            storeProductModel: storeProductModel,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30),
          border: Border.all(
            color: Colors.blue.shade800,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Container(
                  width: screenWidth(3),
                  height: screenWidth(15),
                  padding: EdgeInsetsDirectional.only(start: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      bottomStart: Radius.circular(30),
                    ),
                    color: Colors.grey,
                  ),
                  child: RatingBarIndicator(
                    rating: storeProductModel.rating != null
                        ? storeProductModel.rating!.rate ?? 0.0
                        : 0.0,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: screenWidth(17),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth(20)),
            Image.network(
              storeProductModel.image ?? "",
              width: screenWidth(4),
              height: screenWidth(5),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: screenWidth(25),
              ),
              child: Text(
                storeProductModel.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: screenWidth(25),
                horizontal: screenWidth(25),
              ),
              child: Row(
                children: [
                  Text(
                    "Price: ",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${storeProductModel.price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
