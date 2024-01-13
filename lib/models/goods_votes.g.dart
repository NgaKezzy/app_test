// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_votes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsVotes _$GoodsVotesFromJson(Map<String, dynamic> json) => GoodsVotes(
      idProduct: json['idProduct'] as String,
      idReceipt: json['idReceipt'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantityAccordingToDocuments: json['quantityAccordingToDocuments'] as int,
      actualQuantityImported: json['actualQuantityImported'] as int,
    );

Map<String, dynamic> _$GoodsVotesToJson(GoodsVotes instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'idReceipt': instance.idReceipt,
      'unitPrice': instance.unitPrice,
      'quantityAccordingToDocuments': instance.quantityAccordingToDocuments,
      'actualQuantityImported': instance.actualQuantityImported,
    };
