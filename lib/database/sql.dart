class DatabaseSql {
  static final String dropTableWork = 'DROP TABLE work';

  static final String createTableWork = 'CREATE TABLE IF NOT EXISTS work' +
      '(' +
      'id INTEGER PRIMARY KEY,' +
      'name TEXT,' +
      'client TEXT,' +
      'constructionArea TEXT,' +
      'artNumber TEXT,' +
      'initDate INTEGER' +
      ')';
  static final String createTableCheckList =
      'CREATE TABLE IF NOT EXISTS checkList' +
          '(' +
          'id INTEGER PRIMARY KEY,' +
          'percentageCompleted INTEGER,' +
          'description TEXT,' +
          'payAtention TEXT,' +
          'step TEXT,' +
          'workId INTEGER,' +
          'FOREIGN KEY (workId) REFERENCES work(id) ON DELETE CASCADE'
              ')';
  static final String dropTableCheckList = 'DROP TABLE checkList';

  static final createTableCornerStone =
      'CREATE TABLE IF NOT EXISTS cornerStone' +
          '('
              'id INTEGER PRIMARY KEY,' +
          'name TEXT' +
          ')';
  static final dropTableConerStone = 'DROP TABLE cornerStone';

  static final createTableWorkCornerStone =
      'CREATE TABLE IF NOT EXISTS workCornerStone' +
          '(' +
          'id INTEGER PRIMARY KEY,' +
          'workId INTEGER,' +
          'cornerStoneId INTEGER,' +
          'grade REAL,' +
          'savedAt INTEGER,' +
          'FOREIGN KEY (workId) REFERENCES work(id) ON DELETE CASCADE ON UPDATE CASCADE,' +
          'FOREIGN KEY (cornerStoneId) REFERENCES cornerStone(id) ON DELETE CASCADE' +
          ')';
  static final dropTableWorkCornerStone = 'DROP TABLE workCornerStone';
}
