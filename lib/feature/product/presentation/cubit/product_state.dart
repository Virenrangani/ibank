import '../../domain/product_entity/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductPaginationLoading extends ProductState {
  final List<ProductEntity> products;
  ProductPaginationLoading(this.products);
}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  final bool hasReachedMax;

  ProductSuccess(this.products, {this.hasReachedMax = false});
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}