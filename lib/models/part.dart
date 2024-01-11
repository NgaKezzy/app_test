import 'package:json_annotation/json_annotation.dart';

part 'part.g.dart';

@JsonSerializable()
class Part {
  final String id;
  final String name;

  Part({required this.id, required this.name});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}
