import 'package:flutter/material.dart';
import 'package:test_app/pages/products/add_product.dart';
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
    );
  }
}
