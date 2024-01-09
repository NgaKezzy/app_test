import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/cubit/product_state.dart';
import 'package:test_app/pages/products/add_product.dart';
import 'package:test_app/pages/products/item_product.dart';
import 'package:test_app/widgets/header_app.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          title: HeaderApp(
              callback: () {
                Navigator.pop(context);
              },
              title: 'Danh sách sản phẩm'),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state.products == null || state.products!.isEmpty) {
              return const Center(
                child: Text('Chưa có sản phẩm nào !'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.products!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return ItemProduct(
                  product: state.products?[index],
                );
              },
            );
          },
        ));
  }
}
