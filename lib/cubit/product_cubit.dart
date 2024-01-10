import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final db = FirebaseDatabase.instance.ref().child('Products');

  void addProduct(Product product) {
    emit(state.copyWith(status: ProductStatus.loading));

    List<Product>? newProducts = state.products;

    if (newProducts != null) {
      for (var element in newProducts) {
        if (element.id == product.id) {
          Fluttertoast.showToast(
              msg: "Trùng id với sản phẩm đã có !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
      }

      db.child(product.id.toString()).set({
        'id': product.id,
        'name': product.name,
        'unit': product.unit,
      }).then((value) => {
            getProducts(),
            Fluttertoast.showToast(
                msg: "Thêm sản phẩm thành công !",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0),
          });
    }
  }

  Future<void> getProducts() async {
    printYellow('lấy thông tin sản phẩm');

    emit(state.copyWith(status: ProductStatus.loading));
    List<Product> newProducts = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      printYellow('rỗng');

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
        printRed(product.name);
      },
    );

    emit(state.copyWith(status: ProductStatus.loading, products: newProducts));
  }

  Future<void> removeProduct(int idProduct) async {
    await db.child(idProduct.toString()).remove().then((value) => {
          getProducts(),
          Fluttertoast.showToast(
              msg: "Xóa sản phẩm thành công !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0),
        });
  }

  Future<void> updateProduct(Product product) async {
    await db.child(product.id.toString()).update({
      'name': product.name,
      'unit': product.unit,
    });
    getProducts();
    Fluttertoast.showToast(
        msg: "Sửa thành công !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
