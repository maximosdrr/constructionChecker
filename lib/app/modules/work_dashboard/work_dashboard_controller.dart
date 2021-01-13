import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/models/corner_stone_avg.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:constructionChecker/services/check_list/icheck_list_service.dart';
import 'package:constructionChecker/services/corner_stone/icorner_stone_service.dart';
import 'package:constructionChecker/services/work/iwork_service.dart';
import 'package:constructionChecker/services/work_corner_stone/iwork_corner_stone_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'work_dashboard_controller.g.dart';

@Injectable()
class WorkDashboardController = _WorkDashboardControllerBase
    with _$WorkDashboardController;

abstract class _WorkDashboardControllerBase with Store {
  final ICheckListService checkListService;
  final IWorkService workService;
  final IWorkCornerStoneService workCornerStoneService;
  final ICornerStoneService cornerStoneService;
  final HomeController _homeController = Modular.get<HomeController>();

  _WorkDashboardControllerBase(
    this.checkListService,
    this.workService,
    this.workCornerStoneService,
    this.cornerStoneService,
  ) {
    getCheckLists();
    getWorkCornerStones();
    getCornerStoneAvg();
  }

  @observable
  ObservableFuture<List<ICheckList>> checkLists = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<IWorkCornerStone>> workCornerStones =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ICornerStoneAvg>> cornerStonesAvg =
      ObservableFuture.value([]);

  @observable
  ICornerStoneAvg selectedCornerStoneAvg;

  @action
  getCheckLists() async {
    checkLists = checkListService
        .findMany(_homeController.selectedWork.id)
        .asObservable();
  }

  @action
  getWorkCornerStones() {
    workCornerStones = workCornerStoneService
        .findMany(_homeController.selectedWork.id)
        .asObservable();
  }

  @action
  getCornerStoneAvg() async {
    cornerStonesAvg = workCornerStoneService
        .getWorkCornerStonesAvg(_homeController.selectedWork.id)
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

  insertWorkCornerStone(IWorkCornerStone workCornerStone) async {
    workCornerStone.workId = _homeController.selectedWork.id;
    return await workCornerStoneService.insert(workCornerStone);
  }

  deleteWorkCornerStone(id) async {
    return await workCornerStoneService.delete(id);
  }

  updateWorkCornerStone(IWorkCornerStone workCornerStone) async {
    return await workCornerStoneService.update(workCornerStone);
  }
}
