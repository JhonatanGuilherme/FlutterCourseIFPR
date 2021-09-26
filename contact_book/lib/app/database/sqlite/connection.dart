import 'package:contact_book/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _database;

  static get() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'database.db');
      _database ??= await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insertContact1);
          db.execute(insertContact2);
          db.execute(insertContact3);
        },
      );
    }

    return _database;
  }
}
