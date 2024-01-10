import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final db = FirebaseDatabase.instance.ref().child('Products');

  bool isAddProduct = false;

  Future<void> addProduct(Product product) async {
    isAddProduct = false;
    emit(state.copyWith(status: ProductStatus.loading));

    List<Product>? newProducts = state.products;

    if (newProducts != null) {
      for (var element in newProducts) {
        if (element.id == product.id) {
          return;
        }
      }
      await db.child(product.id.toString()).set({
        'id': product.id,
        'name': product.name,
        'unit': product.unit,
      }).then((value) => {
            getProducts(),
            isAddProduct = true,
          });
    }
  }

  Future<void> getProducts() async {
    emit(state.copyWith(status: ProductStatus.loading));
    List<Product> newProducts = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(
          state.copyWith(products: newProducts, status: ProductStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Product product;
        product = Product.fromJson(value);
        newProducts.add(product);
        printGreen(product.name);
      },
    );

    emit(state.copyWith(status: ProductStatus.loading, products: newProducts));
  }

  Future<void> removeProduct(int idProduct) async {
    await db.child(idProduct.toString()).remove();
    getProducts();
  }

  Future<void> updateProduct(Product product) async {
    await db.child(product.id.toString()).update({
      'name': product.name,
      'unit': product.unit,
    });
    getProducts();
  }
}
