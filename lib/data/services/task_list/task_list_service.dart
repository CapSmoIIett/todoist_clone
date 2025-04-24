

import 'package:todoist_clone/data/repositories/data_base/db_repositories.dart';

class TaskListService {
  TaskListService({
    required DBProvider database
  }) : _bd = database;

  final DBProvider _bd;

}