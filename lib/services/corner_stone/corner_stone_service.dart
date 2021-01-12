import 'package:constructionChecker/models/cornerstone.dart';
import 'package:constructionChecker/repositories/corner_stone/icorner_stone_repo.dart';
import 'package:constructionChecker/services/corner_stone/icorner_stone_service.dart';

class CornerStoneService implements ICornerStoneService {
  IConerStoneRepo cornerStoneRepo;
  CornerStoneService(this.cornerStoneRepo);
  @override
  Future<bool> delete(id) async {
    return await cornerStoneRepo.delete(id);
  }

  @override
  Future<List<ICornerStone>> findMany() async {
    return await cornerStoneRepo.findMany();
  }

  @override
  Future<ICornerStone> insert(ICornerStone cornerStone) async {
    return await cornerStoneRepo.insert(cornerStone);
  }

  @override
  Future<ICornerStone> update(ICornerStone cornerStone) async {
    return await cornerStoneRepo.update(cornerStone);
  }
}
