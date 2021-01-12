import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/repositories/check_list/icheck_list_repo.dart';
import 'package:constructionChecker/services/check_list/icheck_list_service.dart';

class CheckListService implements ICheckListService {
  ICheckListRepo checkListRepo;

  CheckListService(this.checkListRepo);

  insert(ICheckList checkList) async {
    return await checkListRepo.insert(checkList);
  }

  delete(id) async {
    return await checkListRepo.delete(id);
  }

  update(ICheckList checkList) async {
    return await checkListRepo.update(checkList);
  }

  Future<List<ICheckList>> findMany(workId) async {
    return await checkListRepo.findMany(workId);
  }

  @override
  Future<List<ICheckList>> completedItens(workId) async {
    return await checkListRepo.completedItens(workId);
  }

  @override
  Future<List<ICheckList>> incompletedItens(workId) async {
    return await checkListRepo.incompletedItens(workId);
  }
}
