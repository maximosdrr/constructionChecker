class DatabaseSql {
  static final String deleteTableWork = 'DROP TABLE work';

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
          'workId INTEGER' +
          ')';
  static final String dropTableCheckList = 'DROP TABLE checkList';

  static final createTableCornerStone =
      'CREATE TABLE IF NOT EXISTS cornerStone' +
          '('
              'id INTEGER PRIMARY KEY,' +
          'name TEXT' +
          ')';
  static final deleteTableConerStone = 'DROP TABLE cornerStone';
}
