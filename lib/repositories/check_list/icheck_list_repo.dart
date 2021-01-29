import 'package:constructionChecker/models/check_list.dart';

abstract class ICheckListRepo {
  Future<ICheckList> insert(ICheckList checkList);
  Future<List<ICheckList>> findMany(workId);
  Future<ICheckList> findOne(id);
  Future<bool> checkListExists(id);
  Future<ICheckList> update(ICheckList checkList);
  Future<bool> delete(id);
  Future<bool> deleteByWorkId(id);
  Future<List<ICheckList>> completedItens(workId);
  Future<List<ICheckList>> incompletedItens(workId);
}
