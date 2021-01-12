import 'package:constructionChecker/models/check_list.dart';

abstract class ICheckListService {
  Future<ICheckList> insert(ICheckList checkList);
  Future<bool> delete(id);
  Future<ICheckList> update(ICheckList checkList);
  Future<List<ICheckList>> findMany(workId);
  Future<List<ICheckList>> completedItens(workId);
  Future<List<ICheckList>> incompletedItens(workId);
}
