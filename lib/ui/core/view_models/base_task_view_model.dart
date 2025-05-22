import 'package:flutter/material.dart';
import '../../models/base_task_model.dart';

abstract class BaseTaskViewModel<T extends BaseTaskModel> extends ChangeNotifier {
  @protected
  List<T> _tasks = [];

  List<T> get tasks => _tasks;

  void addTask(T task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(T task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(T oldTask, T newTask) {
    final index = _tasks.indexWhere((task) => task.title == oldTask.title);
    if (index != -1) {
      _tasks[index] = newTask;
      notifyListeners();
    }
  }

  void toggleTaskCompletion(T task) {
    final index = _tasks.indexWhere((t) => t.title == task.title);
    if (index != -1) {
      _tasks[index] = task.copyWith(isCompleted: !task.isCompleted) as T;
      notifyListeners();
    }
  }

  List<T> getTodayTasks() {
    final now = DateTime.now();
    return _tasks.where((task) {
      return task.dueDate.year == now.year &&
          task.dueDate.month == now.month &&
          task.dueDate.day == now.day;
    }).toList();
  }

  List<T> getUpcomingTasks() {
    final now = DateTime.now();
    return _tasks.where((task) {
      return task.dueDate.isAfter(now);
    }).toList();
  }
} 