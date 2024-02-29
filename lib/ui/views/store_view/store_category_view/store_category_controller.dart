import 'package:get/get.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/core/data/repository/store_repository.dart';

class StoreCategoryController extends GetxController {
  RxList<String> categories = <String>[].obs;
  RxInt selectedCategory = 1.obs;
  RxList<StoreProductModel> products = <StoreProductModel>[].obs;

  @override
  void onInit() async {
    await getAllCategory();
    await getProductInCategory(categories[selectedCategory.value]);
    super.onInit();
  }

  Future getAllCategory() async {
    await StoreRepository().getAllCategory().then((value) {
      value.fold((l) {}, (r) {
        categories.clear();
        categories.add("All");
        categories.addAll(r);
      });
    });
  }

  Future getAllProduct() async {
    await StoreRepository().getAllProduct().then((value) {
      value.fold((l) {}, (r) {
        products.clear();
        products.addAll(r);
      });
    });
  }

  Future getProductInCategory(String category) async {
    await StoreRepository()
        .getProductInCategory(
      category: category,
    )
        .then((value) {
      value.fold((l) {}, (r) {
        products.clear();
        products.addAll(r);
      });
    });
  }
}
