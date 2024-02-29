import 'package:get/get.dart';
import 'package:task_P2/core/data/models/cart_model.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;

  RxInt cartCount = 0.obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble deliveryFees = 0.0.obs;
  RxDouble total = 0.0.obs;

  double taxPercent = 0.18;
  double deliveryPercent = 0.10;

  CartService() {
    calcCartCount();
    calcTotals();
  }

  void addToCart({required StoreProductModel model, required int qty}) {
    if (getCartModel(model) != null) {
      int index = cartList
          .indexWhere((element) => element.storeProductModel!.id == model.id);
      cartList[index].qty = cartList[index].qty! + qty;
      cartList[index].totals =
          cartList[index].totals! + calaProductTotal(qty, model);
    } else {
      cartList.add(CartModel(
          storeProductModel: model,
          qty: qty,
          totals: calaProductTotal(qty, model)));
    }

    storage.setCartList(cartList);
    cartCount.value += qty;
    calcTotals();
  }

  void removeFromCartList(CartModel model) {
    cartList.remove(model);

    storage.setCartList(cartList);
    cartCount.value -= model.qty ?? 0;
    calcTotals();
  }

  void changeQty({
    required CartModel model,
    required bool incress,
  }) {
    CartModel? result = getCartModel(model.storeProductModel!);

    if (result == null) {
      addToCart(model: model.storeProductModel!, qty: 1);
      return;
    }

    int index = cartList.indexWhere((element) =>
        element.storeProductModel!.id == model.storeProductModel!.id);

    if (incress) {
      result.totals = result.totals! + model.storeProductModel!.price!;
      result.qty = result.qty! + 1;
      cartCount.value += 1;
    } else {
      if (result.qty == 1) return;
      result.totals = result.totals! - model.storeProductModel!.price!;
      result.qty = result.qty! - 1;
      cartCount.value -= 1;
    }

    cartList.removeAt(index);
    cartList.insert(index, result);

    storage.setCartList(cartList);
    calcTotals();
  }

  double calaProductTotal(int qty, StoreProductModel model) {
    return qty * model.price!;
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }

  CartModel? getCartModel(StoreProductModel model) {
    try {
      return cartList.firstWhere(
        (element) => element.storeProductModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  void calcCartCount() {
    // int result = 0;
    // cartList.forEach((element) {
    //   result += element.qty!;
    // });

    // cartCount.value = result;

    cartCount.value =
        cartList.fold(0, (previousValue, element) => element.qty ?? 0);
  }

  void calcTotals() {
    subTotal.value =
        cartList.fold(0, (previousValue, element) => element.totals ?? 0);
    taxAmount.value = subTotal.value * taxPercent;
    deliveryFees.value = subTotal.value * deliveryPercent;
    total.value = subTotal.value + taxAmount.value + deliveryFees.value;
  }
}
