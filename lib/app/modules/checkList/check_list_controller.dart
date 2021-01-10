import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/repositories/check_list/icheck_list_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'check_list_controller.g.dart';

@Injectable()
class CheckListController = _CheckListControllerBase with _$CheckListController;

abstract class _CheckListControllerBase with Store {
  final ICheckListRepo checkListRepo;
  final HomeController _homeController = Modular.get<HomeController>();

  @observable
  ObservableFuture<List<ICheckList>> checkLists = ObservableFuture.value([]);

  _CheckListControllerBase(this.checkListRepo) {
    getCheckLists();
  }

  Future<bool> insert(ICheckList checkList) async {
    checkList.workId = _homeController.selectedWork.id;
    return await checkListRepo.insert(checkList);
  }

  @action
  getCheckLists() async {
    checkLists =
        checkListRepo.findMany(_homeController.selectedWork.id).asObservable();
  }

  delete(id) async {
    return await checkListRepo.delete(id);
  }

  update(ICheckList checkList) async {
    checkList.workId = _homeController.selectedWork.id;
    return await checkListRepo.update(checkList);
  }
}
