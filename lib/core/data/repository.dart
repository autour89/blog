import '../models/fact.dart';

abstract class Repository {
  List<Fact> get facts;
  Future add<T>(T entity);
  Future update<T>(T entity, int index);
  Future delete<T>(int index);

  Future init();
  void close();
}
