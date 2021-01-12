import 'package:constructionChecker/models/work.dart';

abstract class IWorkService {
  Future<IWork> insert(IWork work);
  Future<List<IWork>> findMany();
  Future<bool> deleteWork(id);
  Future<IWork> editWork(IWork workToEdit);
}
