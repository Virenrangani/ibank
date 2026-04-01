import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/feature/product/domain/use_case/product_use_case.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUseCase productsUseCase;

  ProductCubit(this.productsUseCase) : super(ProductInitial());

  static const int limit = 10;
  int skip = 0;
  bool isFetching = false;

  Future<void> fetchProducts() async {
    try {
      skip = 0;
      isFetching = false;
      emit(ProductLoading());

      final products = await productsUseCase.callProduct(
        limit: limit,
        skip: skip,
      );

      skip += products.length;

      emit(ProductSuccess(
        products,
        hasReachedMax: products.length < limit,
      ));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> fetchMoreProducts() async {
    final currentState = state;

    if (isFetching) return;
    if (currentState is ProductSuccess && currentState.hasReachedMax) return;
    if (currentState is! ProductSuccess) return;

    try {
      isFetching = true;
      emit(ProductPaginationLoading(currentState.products));

      final newProducts = await productsUseCase.callProduct(
        limit: limit,
        skip: skip,
      );

      skip += newProducts.length;
      isFetching = false;

      final allProducts = [...currentState.products, ...newProducts];

      emit(ProductSuccess(
        allProducts,
        hasReachedMax: newProducts.length < limit,
      ));
    } catch (e) {
      isFetching = false;
      emit(ProductError(e.toString()));
    }
  }
}