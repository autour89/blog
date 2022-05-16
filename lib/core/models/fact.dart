import 'package:json_annotation/json_annotation.dart';

part "fact.g.dart";

@JsonSerializable()
class Fact {
  @JsonKey(name: '_id')
  final String id;
  final DateTime createdAt;
  final String type;
  final String text;

  Fact(
      {required this.id,
      required this.createdAt,
      required this.type,
      required this.text});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
  Map<String, dynamic> toJson() => _$FactToJson(this);
}
