import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoist_clone/ui/models/task_model.dart';


class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    //try {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //} on Exception catch (_) {
      // to-do
    //}

    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY AUTO_INCREMENT,"
          "title TEXT,"
          "descr TEXT"
          ")");
    });
  }

  newTask(TaskModel newTask) async {
    final db = await database;
    var res = db.rawInsert(
      "INSERT Into Task (title,descr)" 
      "VALUES (${newTask.title}, ${newTask.descr});"
    );
    return res;
  }
}


