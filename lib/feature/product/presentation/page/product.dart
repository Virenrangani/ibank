import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ibank/feature/product/presentation/cubit/product_cubit.dart';
import 'package:ibank/feature/product/presentation/page/product_page.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>GetIt.I<ProductCubit>()..fetchProducts(),
            child: ProductPage(),
    );
  }
}
