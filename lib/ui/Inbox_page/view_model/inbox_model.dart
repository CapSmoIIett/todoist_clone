import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist_clone/ui/models/task_model.dart';

class InboxModel extends Cubit<List<TaskModel>> {
  List<TaskModel> _tasks = [
    TaskModel(title: 'Clean shit', descr: ' '),
    TaskModel(title: 'cook diner', descr: ' '),
    TaskModel(title: 'write book', descr: ' '),
    TaskModel(title: 'learn flutter', descr: ' ')
  ];

  InboxModel() : super([]) {
    emit(_tasks);
  }

  List<TaskModel> getTaskList() => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    emit([..._tasks]);
  }

  void removeTask(TaskModel task) {
    _tasks.remove(task);
    emit([..._tasks]);
  }

  void updateTask(TaskModel task) {
    final index = _tasks.indexWhere((t) => t.title == task.title);
    if (index != -1) {
      _tasks[index] = task;
      emit([..._tasks]);
    }
  }
}