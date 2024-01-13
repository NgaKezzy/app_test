import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/config/print_color.dart';
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

  Future<void> getReceipt() async {
    emit(state.copyWith(status: ReceiptStatus.loading));
    List<Receipt> newReceipt = [];
    final snapshot = await db_receipt.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(state.copyWith(receipts: newReceipt, status: ReceiptStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Receipt receipt;
        receipt = Receipt.fromJson(value);
        newReceipt.add(receipt);
        printYellow('lấy về id của phiếu thu: ${receipt.id}');
      },
    );

    emit(state.copyWith(status: ReceiptStatus.success, receipts: newReceipt));
  }

  Future<void> getItemOfReceipts() async {
    emit(state.copyWith(status: ReceiptStatus.loading));
    List<GoodsVotes> newGoodsVotes = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(state.copyWith(
          goodsVotes: newGoodsVotes, status: ReceiptStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        GoodsVotes goodsVotes;
        goodsVotes = GoodsVotes.fromJson(value);
        newGoodsVotes.add(goodsVotes);
        printYellow('lấy về hàng thuộc hóa đơn: ${goodsVotes.idProduct}');
      },
    );

    emit(state.copyWith(
        status: ReceiptStatus.success, goodsVotes: newGoodsVotes));
  }
}
