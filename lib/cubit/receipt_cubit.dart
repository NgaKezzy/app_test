import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/cubit/receipt_state.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/receipt.dart';

class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit() : super(const ReceiptState());

  final db = FirebaseDatabase.instance.ref().child('ItemOfReceipts');
  final db_receipt = FirebaseDatabase.instance.ref().child('Receipts');

  String dateOrder = DateFormat(
    'yyyy-MM-dd',
  ).format(DateTime.now());

  void setDateTimeOrder(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateOrder = value.toString().split(' ')[0]});
  }

  Future<void> addItemOfReceipts(List<GoodsVotes> items) async {
    // ignore: avoid_function_literals_in_foreach_calls
    items.forEach((element) async {
      await db.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'idProduct': element.idProduct,
        'idReceipt': element.idReceipt,
        'unitPrice': element.unitPrice,
        'quantityAccordingToDocuments': element.quantityAccordingToDocuments,
        'actualQuantityImported': element.actualQuantityImported
      });
    });
  }

  Future<void> addReceipt(Receipt receipt) async {
    await db_receipt
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .set({
      'id': receipt.id,
      'idUnit': receipt.idUnit,
      'idPart': receipt.idPart,
      'idWarehouse': receipt.idWarehouse,
      'idStoker': receipt.idStoker,
      'inputDay': receipt.inputDay,
      'deliver': receipt.deliver,
      'deliveryDate': receipt.deliveryDate,
      'number': receipt.number,
      'accordingTo': receipt.accordingTo,
      'originalDocumentNumber': receipt.originalDocumentNumber,
      'inDebt': receipt.inDebt,
      'have': receipt.have,
      'totalPrice': receipt.totalPrice,
    });
  }
}
