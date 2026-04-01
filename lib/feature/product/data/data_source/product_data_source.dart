import 'package:ibank/core/network/api_url/api_end_points.dart';
import '../../../../core/network/dio/api_dio.dart';
import '../product_model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts({required int limit, required int skip});
}

class ProductDataSourceImpl extends ProductDataSource {
  @override
  Future<List<ProductModel>> getProducts({
    required int limit,
    required int skip,
  }) async {
    final response = await ApiDio.dio.get(
      ApiEndPoints.product,
      queryParameters: {
        "limit": limit,
        "skip": skip,
        "select": "title,price",
      },
    );

    final List data = response.data['products'];

    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}