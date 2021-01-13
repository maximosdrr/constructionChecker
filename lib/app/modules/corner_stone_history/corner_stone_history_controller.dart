import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:constructionChecker/services/work_corner_stone/work_corner_stone_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'corner_stone_history_controller.g.dart';

@Injectable()
class CornerStoneHistoryController = _CornerStoneHistoryControllerBase
    with _$CornerStoneHistoryController;

abstract class _CornerStoneHistoryControllerBase with Store {
  final _workDashboardController = Modular.get<WorkDashboardController>();
  final HomeController _homeController = Modular.get<HomeController>();
  final WorkCornerStoneService workCornerStoneService;

  _CornerStoneHistoryControllerBase(this.workCornerStoneService) {
    findManyByCornerStone();
  }

  @observable
  ObservableFuture<List<IWorkCornerStone>> workCornerStones =
      ObservableFuture.value([]);

  @action
  findManyByCornerStone() async {
    workCornerStones = workCornerStoneService
        .findManyByCornerStone(
          _homeController.selectedWork.id,
          _workDashboardController.selectedCornerStoneAvg.cornerStone.id,
        )
        .asObservable();
  }

  insertWorkCornerstone(IWorkCornerStone workCornerStone) async {
    workCornerStone.workId = _homeController.selectedWork.id;
    workCornerStone.cornerStoneId =
        _workDashboardController.selectedCornerStoneAvg.cornerStone.id;
    return await workCornerStoneService.insert(workCornerStone);
  }

  deleteWorkCornerStone(id) async {
    return await workCornerStoneService.delete(id);
  }

  update(IWorkCornerStone workCornerStone) async {
    workCornerStone.workId = _homeController.selectedWork.id;
    workCornerStone.cornerStoneId =
        _workDashboardController.selectedCornerStoneAvg.cornerStone.id;
    return await workCornerStoneService.update(workCornerStone);
  }
}
