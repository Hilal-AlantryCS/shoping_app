import 'package:get/get.dart';

class StoreProductDetailsController extends GetxController {
  RxInt qty = 1.obs;

  void incresqty() {
    qty.value++;
  }

  void decresqty() {
    qty.value--;
  }
}
