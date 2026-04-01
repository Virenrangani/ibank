import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent -50) {
        context.read<ProductCubit>().fetchMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.product)),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                ],
              ),
            );
          }

          List products = [];
          bool isLoadingMore = false;

          if (state is ProductSuccess) {
            products = state.products;
          } else if (state is ProductPaginationLoading) {
            products = state.products;
            isLoadingMore = true;
          }

          if (products.isEmpty) {
            return  Center(child: Text(AppStrings.productNotFound));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: products.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == products.length) {
                return  Center(child: CircularProgressIndicator());
              }

              final product = products[index];

              return ListTile(
                contentPadding: AppPadding.edgeAll16,
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryContainer,
                  child: Text('${index + 1}', style: AppTextStyles.titleMedium),
                ),
                title: Text(product.title,style: AppTextStyles.bodyLarge,),
                trailing: Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style:AppTextStyles.caption(color:AppColors.success)
                ),
              );
            },
          );
        },
      ),
    );
  }
}
