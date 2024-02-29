import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/core/data/repository/store_repository.dart';

class StoreProductController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<StoreProductModel> products = <StoreProductModel>[].obs;
  RxList<StoreProductModel> searchProducts = <StoreProductModel>[].obs;

  @override
  void onInit() async {
    getAllProduct();
    super.onInit();
  }

  Future getAllProduct() async {
    await StoreRepository().getAllProduct().then((value) {
      value.fold((l) {}, (r) {
        products.clear();
        products.addAll(r);
        searchProducts.addAll(r);
      });
    });
  }

  void searchByString(String search) {
    if (search.isEmpty) {
      searchProducts.value = products;
    } else {
      searchProducts.value = products
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    }
  }
}
