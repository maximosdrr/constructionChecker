import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/repositories/check_list/icheck_list_repo.dart';
import 'package:sqflite/sqflite.dart';

class CheckListRepo implements ICheckListRepo {
  final Database db;
  CheckListRepo(this.db);
  Future<ICheckList> insert(ICheckList checkList) async {
    try {
      if (db.isOpen) {
        var insertedId = await db.insert('checkList', checkList.toMap());
        checkList.id = insertedId;
        return checkList;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ICheckList>> findMany(workId) async {
    try {
      if (db.isOpen) {
        var checkListsSnapshot = await db.query(
          'checkList',
          where: 'workId=$workId',
          // orderBy: 'step',
        );
        return checkListsSnapshot
            .map((checkList) => ICheckList.fromMap(checkList))
            .toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ICheckList> findOne(id) async {
    try {
      if (db.isOpen) {
        var checkListsSnapshot = await db.query('checkList');
        if (checkListsSnapshot.length == 1) {
          return ICheckList.fromMap(checkListsSnapshot[0]);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> checkListExists(id) async {
    try {
      if (db.isOpen) {
        var checkListsSnapshot = await db.query('checkList');
        if (checkListsSnapshot.length == 1) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<ICheckList> update(ICheckList checkList) async {
    try {
      if (db.isOpen) {
        await db.update('checkList', checkList.toMap(),
            where: 'id=${checkList.id}');
        return checkList;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> delete(id) async {
    try {
      if (db.isOpen) {
        await db.delete('checkList', where: 'id=$id');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteByWorkId(id) async {
    try {
      if (db.isOpen) {
        await db.delete('checkList', where: 'workId=$id');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<ICheckList>> completedItens(workId) async {
    try {
      if (db.isOpen) {
        var checkListsSnapshot = await db.query(
          'checkList',
          where: 'workId=$workId AND percentageCompleted=100',
        );

        return checkListsSnapshot
            .map((checkList) => ICheckList.fromMap(checkList))
            .toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<ICheckList>> incompletedItens(workId) async {
    try {
      if (db.isOpen) {
        var checkListsSnapshot = await db.query(
          'checkList',
          where: 'workId=$workId AND percentageCompleted<100',
        );

        return checkListsSnapshot
            .map((checkList) => ICheckList.fromMap(checkList))
            .toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
