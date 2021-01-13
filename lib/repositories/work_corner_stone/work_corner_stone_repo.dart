import 'package:constructionChecker/models/avg.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:constructionChecker/repositories/work_corner_stone/iwork_corner_stone_repo.dart';
import 'package:sqflite/sqflite.dart';

class WorkCornerStoneRepo implements IWorkCornerStoneRepo {
  Database db;
  WorkCornerStoneRepo(this.db);

  @override
  Future<bool> delete(id) async {
    try {
      if (db.isOpen) {
        await db.delete('workCornerStone', where: 'id=$id');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<IAvg> getCornerStoneAvg(workId, cornerStoneId) async {
    try {
      print(workId);
      print(cornerStoneId);
      if (db.isOpen) {
        var result = await db.rawQuery(
            'SELECT avg(grade) as value FROM workCornerStone WHERE workId=$workId AND cornerStoneId=$cornerStoneId GROUP BY cornerStoneId');
        if (result[0] != null) {
          var avgMap = result[0];
          return IAvg.fromMap(avgMap);
        }
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<IWorkCornerStone>> findMany(workId) async {
    try {
      if (db.isOpen) {
        var databaseSnapshot =
            await db.query('workCornerStone', where: 'workId=$workId');
        return databaseSnapshot
            .map((w) => IWorkCornerStone.fromMap(w))
            .toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<IWorkCornerStone> insert(IWorkCornerStone iWorkCornerStone) async {
    try {
      if (db.isOpen) {
        var insertedId =
            await db.insert('workCornerStone', iWorkCornerStone.toMap());
        iWorkCornerStone.id = insertedId;
        return iWorkCornerStone;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<IWorkCornerStone> update(IWorkCornerStone iWorkCornerStone) async {
    try {
      if (db.isOpen) {
        await db.update('workCornerStone', iWorkCornerStone.toMap());
        return iWorkCornerStone;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<IWorkCornerStone>> findManyByCornerStone(
      workId, cornerStoneId) async {
    try {
      if (db.isOpen) {
        var databaseSnapshot = await db.query('workCornerStone',
            where: 'workId=$workId AND cornerStoneId=$cornerStoneId');
        return databaseSnapshot
            .map((w) => IWorkCornerStone.fromMap(w))
            .toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
