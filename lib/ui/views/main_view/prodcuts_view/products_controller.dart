import 'package:get/get.dart';
import 'package:task_P2/core/data/models/cart_model.dart';
import 'package:task_P2/core/data/models/product_model.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class ProductsController extends GetxController {
  RxList<StoreProductModel> productList = <StoreProductModel>[].obs;

  RxInt count = 0.obs;

  @override
  void onInit() {
    getAllProdcut();
    super.onInit();
  }

  void getAllProdcut() {
    productRepository.getAllProduct().then((value) {
      value.fold((l) {}, (r) {
        productList.clear();
        productList.addAll(r);
      });
    });
  }

  void addToCart(CartModel cartModel, bool isMinus) {
    // storage.changeItemCount(cartModel,isMinus: isMinus);
    count.value += 1;
  }

  // int getItemCount(ProductModel model) {
  // //  return storege.getItemQty(model);
  // }
}
