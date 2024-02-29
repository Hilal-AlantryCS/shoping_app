import 'package:get/get.dart';
import 'package:task_P2/core/data/models/cart_model.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/main_view/prodcuts_view/products_controller.dart';

class CartController extends GetxController {
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxInt count = 0.obs;

  @override
  void onInit() {
    cartList.addAll(storage.getCartList());
    print(cartList.length.toString());
    super.onInit();
  }

  // @override
  // void dispose() {
  //   Get.delete<CartController>();
  //   super.dispose();
  // }

  void addToCart(CartModel cartModel, bool isMinus) {
    // storage.changeItemCount(cartModel, isMinus: isMinus);
    // count.value += 1;
    // // Get.find<ProductsController>().count.value += 1;
  }

  void deleteItem(int itemIndex) {
    // cartList.removeAt(itemIndex);
    // storage.deleteCartItem(itemIndex);
    // count.value -= 1;
  }
}
