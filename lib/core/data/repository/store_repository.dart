import 'package:dartz/dartz.dart';
import 'package:task_P2/core/data/models/common_response.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/core/utils/network_util.dart';

class StoreRepository {
  Future<Either<String, List<String>>> getAllCategory() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/categories',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<String> result = [];
          commonResponse.data!.forEach((element) {
            result.add(element);
          });
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<StoreProductModel>>> getProductInCategory({
    required String category,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/category/$category',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<StoreProductModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(StoreProductModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<StoreProductModel>>> getAllProduct() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<StoreProductModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(StoreProductModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
