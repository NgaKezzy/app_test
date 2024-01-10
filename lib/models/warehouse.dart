import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart';

@JsonSerializable()
class Warehouses {
  final String id;
  final String address;
  final String name;

  Warehouses({required this.id, required this.address, required this.name});

  factory Warehouses.fromJson(Map<String, dynamic> json) =>
      _$WarehousesFromJson(json);

  Map<String, dynamic> toJson() => _$WarehousesToJson(this);
}