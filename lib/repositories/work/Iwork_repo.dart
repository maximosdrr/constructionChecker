import 'package:constructionChecker/models/work.dart';

abstract class IWorkRepo {
  Future<bool> insert(IWork work);
  Future<List<IWork>> findMany();
  Future<IWork> findOne(id);
  Future<bool> update(IWork work);
  Future<bool> delete(id);
}
