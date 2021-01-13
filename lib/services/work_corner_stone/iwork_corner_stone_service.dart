import 'package:constructionChecker/models/avg.dart';
import 'package:constructionChecker/models/corner_stone_avg.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';

abstract class IWorkCornerStoneService {
  Future<IWorkCornerStone> insert(IWorkCornerStone iWorkCornerStone);
  Future<List<IWorkCornerStone>> findMany(workId);
  Future<List<IWorkCornerStone>> findManyByCornerStone(workId, cornerStoneId);
  Future<IWorkCornerStone> update(IWorkCornerStone iWorkCornerStone);
  Future<bool> delete(id);
  Future<IAvg> getCornerStoneAvg(workId, cornerStoneId);
  Future<List<ICornerStoneAvg>> getWorkCornerStonesAvg(workId);
}
