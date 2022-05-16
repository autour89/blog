import 'package:blog/core/models/fact.dart' as dto;
import 'package:hive_flutter/hive_flutter.dart';

part 'fact_table.g.dart';

@HiveType(typeId: 1)
class Fact extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final DateTime createdAt;

  Fact(
      {required this.id,
      required this.text,
      required this.type,
      required this.createdAt});

  factory Fact.fromDto(dto.Fact model) {
    return Fact(
        id: model.id,
        type: model.type,
        text: model.text,
        createdAt: model.createdAt);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'type': type,
        'text': text,
        'createdAt': createdAt.toIso8601String()
      };
}
