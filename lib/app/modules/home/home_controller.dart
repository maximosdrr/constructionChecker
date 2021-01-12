import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/repositories/check_list/icheck_list_repo.dart';
import 'package:constructionChecker/repositories/work/Iwork_repo.dart';
import 'package:constructionChecker/services/work/iwork_service.dart';
import 'package:constructionChecker/services/work/work_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IWorkService workService;

  @observable
  ObservableFuture<List<IWork>> works = ObservableFuture.value([]);

  @observable
  IWork selectedWork;

  _HomeControllerBase(this.workService) {
    getWorks();
  }

  insert(IWork work) async {
    return await workService.insert(work);
  }

  @action
  selectWork(IWork work) {
    selectedWork = work;
  }

  @action
  getWorks() async {
    works = workService.findMany().asObservable();
  }

  deleteWork(int id) async {
    return await workService.deleteWork(id);
  }

  editWork(IWork workToEdit) async {
    return await workService.editWork(workToEdit);
  }
}
