import 'package:constructionChecker/models/cornerstone.dart';

abstract class IConerStoneRepo {
  Future<ICornerStone> insert(ICornerStone cornerStone);
  Future<List<ICornerStone>> findMany();
  Future<ICornerStone> update(ICornerStone cornerStone);
  Future<bool> delete(id);
}
