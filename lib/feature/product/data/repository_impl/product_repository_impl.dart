import 'package:ibank/feature/product/data/data_source/product_data_source.dart';
import 'package:ibank/feature/product/domain/product_entity/product_entity.dart';
import 'package:ibank/feature/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<List<ProductEntity>> getProducts({
    required int limit,
    required int skip,
  }) async {
    final products = await productDataSource.getProducts(
      limit: limit,
      skip: skip,
    );

    return products
        .map((e) => ProductEntity(id: e.id, title: e.title, price: e.price))
        .toList();
  }
}