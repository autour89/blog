// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: json['type'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': instance.type,
      'text': instance.text,
    };
