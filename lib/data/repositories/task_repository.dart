import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/base_task_model.dart';

class TaskRepository {
  static Database? _database;
  static const String _tableName = 'tasks';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT,
            dueDate TEXT NOT NULL,
            isCompleted INTEGER NOT NULL,
            priorityColor INTEGER NOT NULL,
            type TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertTask(BaseTaskModel task, String type) async {
    final db = await database;
    return await db.insert(_tableName, {
      'title': task.title,
      'description': task.description,
      'dueDate': task.dueDate.toIso8601String(),
      'isCompleted': task.isCompleted ? 1 : 0,
      'priorityColor': task.priorityColor.value,
      'type': type,
    });
  }

  Future<List<Map<String, dynamic>>> getTasks(String type) async {
    final db = await database;
    return await db.query(
      _tableName,
      where: 'type = ?',
      whereArgs: [type],
    );
  }

  Future<int> updateTask(BaseTaskModel task, String type) async {
    final db = await database;
    return await db.update(
      _tableName,
      {
        'title': task.title,
        'description': task.description,
        'dueDate': task.dueDate.toIso8601String(),
        'isCompleted': task.isCompleted ? 1 : 0,
        'priorityColor': task.priorityColor.value,
      },
      where: 'title = ? AND type = ?',
      whereArgs: [task.title, type],
    );
  }

  Future<int> deleteTask(String title, String type) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: 'title = ? AND type = ?',
      whereArgs: [title, type],
    );
  }

  Future<void> toggleTaskCompletion(String title, String type) async {
    final db = await database;
    final task = await db.query(
      _tableName,
      where: 'title = ? AND type = ?',
      whereArgs: [title, type],
    );

    if (task.isNotEmpty) {
      final isCompleted = task.first['isCompleted'] == 1;
      await db.update(
        _tableName,
        {'isCompleted': isCompleted ? 0 : 1},
        where: 'title = ? AND type = ?',
        whereArgs: [title, type],
      );
    }
  }
} 