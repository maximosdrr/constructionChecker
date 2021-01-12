import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/services/check_list/icheck_list_service.dart';
import 'package:constructionChecker/services/work/iwork_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'work_dashboard_controller.g.dart';

@Injectable()
class WorkDashboardController = _WorkDashboardControllerBase
    with _$WorkDashboardController;

abstract class _WorkDashboardControllerBase with Store {
  final ICheckListService checkListService;
  final IWorkService workService;
  final HomeController _homeController = Modular.get<HomeController>();

  _WorkDashboardControllerBase(this.checkListService, this.workService) {
    getCompletedCheckLists();
    getIncompletedCheckLists();
    getCheckLists();
  }

  @observable
  ObservableFuture<List<ICheckList>> completedItens =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ICheckList>> incompletedItens =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ICheckList>> checkLists = ObservableFuture.value([]);

  @action
  getCheckLists() async {
    checkLists = checkListService
        .findMany(_homeController.selectedWork.id)
        .asObservable();
  }

  @action
  getCompletedCheckLists() async {
    completedItens = checkListService
        .completedItens(_homeController.selectedWork.id)
        .asObservable();
  }

  @action
  getIncompletedCheckLists() async {
    incompletedItens = checkListService
        .incompletedItens(_homeController.selectedWork.id)
        .asObservable();
  }

  Future<ICheckList> insertCheckList(ICheckList checkList) async {
    checkList.workId = _homeController.selectedWork.id;
    return await checkListService.insert(checkList);
  }

  deleteCheckList(id) async {
    return await checkListService.delete(id);
  }

  updateCheckList(ICheckList checkList) async {
    checkList.workId = _homeController.selectedWork.id;
    return await checkListService.update(checkList);
  }
}
