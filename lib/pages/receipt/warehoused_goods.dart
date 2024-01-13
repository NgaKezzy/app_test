import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/app_size.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/widgets/custom_drop_down.dart';
import 'package:test_app/widgets/custom_text_field.dart';

final productDownController = DropdownController();

class WarehousedGoods extends StatefulWidget {
  const WarehousedGoods(
      {super.key,
      required this.priceController,
      required this.quantityController,
      required this.realController,
      required this.product,
      this.callback,
      this.onChanged});
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController realController;
  final Product product;
  final ValueChanged<String>? onChanged;
  final VoidCallback? callback;

  @override
  State<WarehousedGoods> createState() => _WarehousedGoodsState();
}

class _WarehousedGoodsState extends State<WarehousedGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Colors.grey, width: 1, style: BorderStyle.solid)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomTextField(
                    callback: (value) {
                      widget.onChanged?.call(value);
                    },
                    controller: widget.priceController,
                    labelText: 'Giá',
                    type: TextInputType.number,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.4,
                child: CustomTextField(
                  callback: (value) {
                    widget.onChanged?.call(value);
                  },
                  controller: widget.quantityController,
                  labelText: 'Số lượng',
                  type: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.4,
                child: CustomTextField(
                  controller: widget.realController,
                  labelText: 'Thực nhận',
                  type: TextInputType.number,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
