import 'package:constructionChecker/models/cornerstone.dart';
import 'package:constructionChecker/repositories/corner_stone/icorner_stone_repo.dart';
import 'package:sqflite/sqflite.dart';

class CornerStoneRepo implements IConerStoneRepo {
  Database db;
  CornerStoneRepo(this.db);

  @override
  Future<bool> delete(id) async {
    try {
      if (db.isOpen) {
        await db.delete('cornerStone', where: 'id=$id');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<ICornerStone>> findMany() async {
    try {
      if (db.isOpen) {
        var cornerStoneSnapshot = await db.query('cornerStone');
        return cornerStoneSnapshot
            .map((cornerStone) => ICornerStone.fromMap(cornerStone))
            .toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ICornerStone> insert(ICornerStone cornerStone) async {
    try {
      if (db.isOpen) {
        var insertedId = await db.insert('cornerStone', cornerStone.toMap());
        cornerStone.id = insertedId;
        return cornerStone;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ICornerStone> update(ICornerStone cornerStone) async {
    try {
      if (db.isOpen) {
        await db.update('cornerStone', cornerStone.toMap());
        return cornerStone;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
