import 'package:json_annotation/json_annotation.dart';

part 'receipt.g.dart';

@JsonSerializable()
class Receipt {
  final int id;
  final String idUnit;
  final String idPart;
  final String idWarehouse;
  final String idStoker;
  final String inputDay;
  final String deliver;
  final String deliveryDate;
  final int number;
  final String accordingTo;
  final String originalDocumentNumber;
  final int inDebt;
  final int have;
  final String totalPrice;

  Receipt(
      {required this.id,
      required this.idUnit,
      required this.idPart,
      required this.idWarehouse,
      required this.idStoker,
      required this.inputDay,
      required this.deliver,
      required this.deliveryDate,
      required this.number,
      required this.accordingTo,
      required this.originalDocumentNumber,
      required this.inDebt,
      required this.have,
      required this.totalPrice});

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
