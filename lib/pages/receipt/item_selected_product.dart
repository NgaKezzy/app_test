import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/models/product.dart';

class ItemSelectProduct extends StatefulWidget {
  const ItemSelectProduct({
    super.key,
    required this.product,
    this.callback,
  });
  final Product product;
  final VoidCallback? callback;

  @override
  State<ItemSelectProduct> createState() => _ItemSelectProductState();
}

class _ItemSelectProductState extends State<ItemSelectProduct> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.callback?.call();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Colors.grey, style: BorderStyle.solid)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text('ID: ${widget.product.id}'),
              Text('Tên sản phẩm:${widget.product.name}'),
            ]),
            Column(
              children: [
                isSelected
                    ? Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green),
                        child: Icon(Icons.check))
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
