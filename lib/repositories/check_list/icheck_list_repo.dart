import 'package:constructionChecker/models/check_list.dart';

abstract class ICheckListRepo {
  Future<bool> insert(ICheckList checkList);
  Future<List<ICheckList>> findMany(workId);
  Future<ICheckList> findOne(id);
  Future<bool> checkListExists(id);
  Future<bool> update(ICheckList checkList);
  Future<bool> delete(id);
}
