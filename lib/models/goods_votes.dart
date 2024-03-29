import 'package:json_annotation/json_annotation.dart';

part 'goods_votes.g.dart';

@JsonSerializable()
class GoodsVotes {
  final String idProduct;
  final String idReceipt;
  final String unitPrice;
  final String quantityAccordingToDocuments;
  final String actualQuantityImported;

  GoodsVotes(
      {required this.idProduct,
      required this.idReceipt,
      required this.unitPrice,
      required this.quantityAccordingToDocuments,
      required this.actualQuantityImported});

  factory GoodsVotes.fromJson(Map<String, dynamic> json) =>
      _$GoodsVotesFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsVotesToJson(this);
}
