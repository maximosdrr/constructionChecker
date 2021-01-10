import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/repositories/work/Iwork_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IWorkRepo workRepository;

  @observable
  ObservableFuture<List<IWork>> works = ObservableFuture.value([]);

  @observable
  IWork selectedWork;

  _HomeControllerBase(this.workRepository) {
    getWorks();
  }

  insert(IWork work) async {
    return await workRepository.insert(work);
  }

  @action
  selectWork(IWork work) {
    selectedWork = work;
  }

  @action
  getWorks() async {
    works = workRepository.findMany().asObservable();
  }

  deleteWork(int id) async {
    return await workRepository.delete(id);
  }

  editWork(IWork workToEdit) async {
    return await workRepository.update(workToEdit);
  }
}
