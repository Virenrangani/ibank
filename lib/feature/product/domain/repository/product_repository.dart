import '../product_entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts({required int limit, required int skip});
}
