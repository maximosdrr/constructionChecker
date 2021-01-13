import 'package:constructionChecker/models/avg.dart';
import 'package:constructionChecker/models/corner_stone_avg.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:constructionChecker/repositories/corner_stone/corner_stone_repo.dart';
import 'package:constructionChecker/repositories/work_corner_stone/work_corner_stone_repo.dart';
import 'package:constructionChecker/services/work_corner_stone/iwork_corner_stone_service.dart';

class WorkCornerStoneService implements IWorkCornerStoneService {
  WorkCornerStoneRepo workCornerStoneRepo;
  CornerStoneRepo cornerStoneRepo;

  WorkCornerStoneService(this.workCornerStoneRepo, this.cornerStoneRepo);
  @override
  Future<bool> delete(id) async {
    return await this.workCornerStoneRepo.delete(id);
  }

  @override
  Future<IAvg> getCornerStoneAvg(workId, cornerStoneId) async {
    return await this
        .workCornerStoneRepo
        .getCornerStoneAvg(workId, cornerStoneId);
  }

  @override
  Future<List<IWorkCornerStone>> findMany(workId) async {
    return await this.workCornerStoneRepo.findMany(workId);
  }

  @override
  Future<IWorkCornerStone> insert(IWorkCornerStone iWorkCornerStone) async {
    return await this.workCornerStoneRepo.insert(iWorkCornerStone);
  }

  @override
  Future<IWorkCornerStone> update(IWorkCornerStone iWorkCornerStone) async {
    return await this.workCornerStoneRepo.update(iWorkCornerStone);
  }

  Future<List<ICornerStoneAvg>> getWorkCornerStonesAvg(workId) async {
    List<ICornerStoneAvg> result = [];
    var cornerStones = await cornerStoneRepo.findMany();

    for (var cornerStone in cornerStones) {
      var avg = await getCornerStoneAvg(workId, cornerStone.id);
      ICornerStoneAvg _cornerStoneAvgToAdd = ICornerStoneAvg(
        avg: avg != null ? avg : IAvg(value: 0),
        cornerStone: cornerStone,
      );

      result.add(_cornerStoneAvgToAdd);
    }
    return result;
  }

  @override
  Future<List<IWorkCornerStone>> findManyByCornerStone(
      workId, cornerStoneId) async {
    return await workCornerStoneRepo.findManyByCornerStone(
        workId, cornerStoneId);
  }
}
