import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/repositories/check_list/icheck_list_repo.dart';
import 'package:constructionChecker/repositories/work/Iwork_repo.dart';
import 'package:constructionChecker/services/work/generate_default_check_list_item.dart';
import 'package:constructionChecker/services/work/iwork_service.dart';

class WorkService implements IWorkService {
  IWorkRepo workRepo;
  ICheckListRepo checkListRepo;

  WorkService(this.workRepo, this.checkListRepo);

  Future<IWork> insert(IWork work) async {
    var insertedWork = await workRepo.insert(work);
    var checkLists = generateDefaultCheckLists(insertedWork.id);

    for (int i = 0; i < checkLists.length; i++) {
      await checkListRepo.insert(checkLists[i]);
    }

    return insertedWork;
  }

  Future<List<IWork>> findMany() async {
    return workRepo.findMany();
  }

  Future<bool> deleteWork(id) async {
    return await workRepo.delete(id) && await checkListRepo.deleteByWorkId(id);
  }

  Future<IWork> editWork(IWork workToEdit) async {
    return await workRepo.update(workToEdit);
  }
}
