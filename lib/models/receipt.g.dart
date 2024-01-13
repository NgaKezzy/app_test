// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => Receipt(
      id: json['id'] as int,
      idUnit: json['idUnit'] as String,
      idPart: json['idPart'] as String,
      idWarehouse: json['idWarehouse'] as String,
      idStoker: json['idStoker'] as String,
      inputDay: json['inputDay'] as String,
      deliver: json['deliver'] as String,
      deliveryDate: json['deliveryDate'] as String,
      number: json['number'] as int,
      accordingTo: json['accordingTo'] as String,
      originalDocumentNumber: json['originalDocumentNumber'] as String,
      inDebt: json['inDebt'] as int,
      have: json['have'] as int,
      totalPrice: json['totalPrice'] as String,
    );

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'id': instance.id,
      'idUnit': instance.idUnit,
      'idPart': instance.idPart,
      'idWarehouse': instance.idWarehouse,
      'idStoker': instance.idStoker,
      'inputDay': instance.inputDay,
      'deliver': instance.deliver,
      'deliveryDate': instance.deliveryDate,
      'number': instance.number,
      'accordingTo': instance.accordingTo,
      'originalDocumentNumber': instance.originalDocumentNumber,
      'inDebt': instance.inDebt,
      'have': instance.have,
      'totalPrice': instance.totalPrice,
    };
