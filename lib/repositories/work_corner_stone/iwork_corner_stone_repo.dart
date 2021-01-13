import 'package:constructionChecker/models/avg.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';

abstract class IWorkCornerStoneRepo {
  Future<IWorkCornerStone> insert(IWorkCornerStone iWorkCornerStone);
  Future<List<IWorkCornerStone>> findMany(workId);
  Future<IWorkCornerStone> update(IWorkCornerStone iWorkCornerStone);
  Future<List<IWorkCornerStone>> findManyByCornerStone(workId, cornerStoneId);
  Future<bool> delete(id);
  Future<IAvg> getCornerStoneAvg(workId, cornerStoneId);
}
