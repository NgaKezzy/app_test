import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/product.dart';

class ItemDetailProduct extends StatefulWidget {
  const ItemDetailProduct({super.key, required this.goodsVotes});
  final GoodsVotes goodsVotes;

  @override
  State<ItemDetailProduct> createState() => _ItemDetailProductState();
}

class _ItemDetailProductState extends State<ItemDetailProduct> {
  String nameProduct = '';
  String unitProduct = '';
  late ProductCubit productCubit;

  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    productCubit.state.products?.forEach((element) {
      if (element.id.toString() == widget.goodsVotes.idProduct) {
        setState(() {
          nameProduct = element.name;
          unitProduct = element.unit;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey, width: 1, style: BorderStyle.solid)),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 - 1,
                  child: RichText(
                      text: TextSpan(
                          text: 'Tên: ',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: nameProduct,
                            style: TextStyle(color: Colors.green)),
                      ]))),
              Container(
                width: 1,
                height: 30,
                color: Colors.grey,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3 - 10,
                  child: Text('Mã số:${widget.goodsVotes.idProduct}')),
              Container(
                width: 1,
                height: 30,
                color: Colors.grey,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3 - 9,
                  child: Text('Đơn vị: $unitProduct')),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 - 1,
                  child: Text(
                      'Chứng từ: ${widget.goodsVotes.quantityAccordingToDocuments}')),
              Container(
                width: 1,
                height: 30,
                color: Colors.grey,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3 - 10,
                  child: Text(
                      'Thực: ${widget.goodsVotes.actualQuantityImported}')),
              Container(
                width: 1,
                height: 30,
                color: Colors.grey,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3 - 9,
                  child: Text('Giá: ${widget.goodsVotes.unitPrice}')),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thành tiền: '),
                  Text(
                    (double.parse(widget.goodsVotes.unitPrice) *
                                double.parse(widget
                                    .goodsVotes.quantityAccordingToDocuments))
                            .toString() +
                        '  ',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
