import 'package:constructionChecker/models/work.dart';

abstract class IWorkRepo {
  Future<IWork> insert(IWork work);
  Future<List<IWork>> findMany();
  Future<IWork> findOne(id);
  Future<IWork> update(IWork work);
  Future<bool> delete(id);
}
