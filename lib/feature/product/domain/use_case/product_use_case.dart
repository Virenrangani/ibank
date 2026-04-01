import 'package:ibank/feature/product/domain/product_entity/product_entity.dart';
import '../repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<List<ProductEntity>> callProduct({
    required int limit,
    required int skip,
  }) {
    return repository.getProducts(limit: limit, skip: skip);
  }
}