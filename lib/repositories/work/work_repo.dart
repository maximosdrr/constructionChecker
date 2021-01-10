import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/repositories/work/Iwork_repo.dart';
import 'package:sqflite/sqflite.dart';

class WorkRepository implements IWorkRepo {
  Database db;
  WorkRepository(this.db);

  Future<bool> insert(IWork work) async {
    try {
      if (db.isOpen) {
        await db.insert('work', work.toMap());
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<IWork>> findMany() async {
    try {
      if (db.isOpen) {
        var worksSnapshot = await db.query('work');
        return worksSnapshot.map((work) => IWork.fromMap(work)).toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<IWork> findOne(id) async {
    try {
      if (db.isOpen) {
        var worksSnapshot = await db.query('work');
        if (worksSnapshot.length == 1) {
          return IWork.fromMap(worksSnapshot[0]);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> workExist(int id) async {
    try {
      if (db.isOpen) {
        var worksSnapshot = await db.query('work');
        if (worksSnapshot.length == 1) {
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

  Future<bool> update(IWork work) async {
    try {
      if (db.isOpen) {
        await db.update('work', work.toMap(), where: 'id=${work.id}');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(id) async {
    try {
      if (db.isOpen) {
        await db.delete('work', where: 'id=$id');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
