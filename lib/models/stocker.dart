import 'package:json_annotation/json_annotation.dart';
part 'stocker.g.dart';

@JsonSerializable()
class Stocker {
  final String id;
  final String name;
  final String address;
  final int phone;

  Stocker(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone});

  factory Stocker.fromJson(Map<String, dynamic> json) =>
      _$StockerFromJson(json);

  Map<String, dynamic> toJson() => _$StockerToJson(this);
}
