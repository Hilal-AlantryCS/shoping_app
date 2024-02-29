import 'dart:convert';
import 'package:task_P2/core/data/models/store_product_model.dart';

class CartModel {
  StoreProductModel? storeProductModel;
  int? qty;
  double? totals;

  CartModel({this.storeProductModel, this.qty, this.totals});

  CartModel.fromJson(Map<String, dynamic> json) {
    storeProductModel = json['product_model'] != null
        ? new StoreProductModel.fromJson(json['product_model'])
        : null;
    qty = json['qty'];
    totals = json['totals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storeProductModel != null) {
      data['product_model'] = this.storeProductModel!.toJson();
    }
    data['qty'] = this.qty;
    data['totals'] = this.totals;
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) => {
        "product_model": model.storeProductModel,
        "qty": model.qty,
        "totals": model.totals
      };

  static String encode(List<CartModel> lists) => json.encode(
        lists
            .map<Map<String, dynamic>>((model) => CartModel.toMap(model))
            .toList(),
      );

  static List<CartModel> decode(String list) =>
      (json.decode(list) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
