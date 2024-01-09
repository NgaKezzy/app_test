import 'package:flutter/material.dart';
import 'package:test_app/models/product.dart';

class ItemProduct extends StatelessWidget {
  ItemProduct({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ID: ${product?.id}'),
              Text('Đơn vị: ${product?.unit}'),
            ],
          ),
          Text('Tên: ${product?.name}'),
        ],
      ),
    );
  }
}
