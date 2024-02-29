import 'package:dartz/dartz.dart';
import 'package:task_P2/core/data/models/common_response.dart';
import 'package:task_P2/core/data/models/product_model.dart';
import 'package:task_P2/core/data/models/store_product_model.dart';
import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/core/utils/network_util.dart';

class ProductRepository {
  Future<Either<String, List<String>>> getcategories() async {
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

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
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
          commonResponse.data!.forEach(
            (element) {
              result.add(StoreProductModel.fromJson(element));
            },
          );
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
