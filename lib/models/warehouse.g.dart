// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warehouse _$WarehousesFromJson(Map<String, dynamic> json) => Warehouse(
      id: json['id'] as String,
      address: json['address'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$WarehousesToJson(Warehouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'name': instance.name,
    };
