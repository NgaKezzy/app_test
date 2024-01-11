// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stocker _$StockerFromJson(Map<String, dynamic> json) => Stocker(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as int,
    );

Map<String, dynamic> _$StockerToJson(Stocker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
    };
