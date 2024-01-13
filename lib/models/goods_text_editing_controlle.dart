import 'package:flutter/material.dart';

class GoodsTextEditingController {
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController realController;

  GoodsTextEditingController(
      {required this.priceController,
      required this.quantityController,
      required this.realController});
}
