import 'package:blog/core/data/hive/fact_table.dart';
import 'package:blog/core/models/fact.dart' as dto;
import 'package:hive_flutter/hive_flutter.dart';

import '../repository.dart';

class HiveRepository implements Repository {
  static const _factsBox = 'facts_box';
  late Box<Fact> _facts;

  /// get all facts
  @override
  List<dto.Fact> get facts {
    return _facts.values
        .map((fact) => dto.Fact.fromJson(fact.toJson()))
        .toList();
  }

  ///add entity to the box
  @override
  Future add<T>(T entity) async {
    if (entity is dto.Fact) {
      await _facts.add(Fact.fromDto(entity));
    }
  }

  /// update stored entity
  @override
  Future update<T>(T entity, int index) async {
    if (entity is dto.Fact) {
      await _facts.putAt(index, Fact.fromDto(entity));
    }
  }

  /// delete the entity by index
  @override
  Future delete<T>(int index) async {
    if (T == dto.Fact) {
      await _facts.delete(index);
    }
  }

  @override
  Future init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(FactAdapter());

    await Hive.openBox<Fact>(_factsBox);

    _facts = Hive.box(_factsBox);
  }

  @override
  void close() {
    Hive.close();
  }
}
