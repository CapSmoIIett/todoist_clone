import 'package:flutter/material.dart';
import '../../../models/base_task_model.dart';
import '../../../data/repositories/task_repository.dart';

abstract class BaseTaskViewModel<T extends BaseTaskModel> extends ChangeNotifier {
  final TaskRepository _repository;
  final String _taskType;
  
  @protected
  List<T> _tasks = [];
  bool _isLoading = false;

  BaseTaskViewModel(this._repository, this._taskType) {
    _loadTasks();
  }

  List<T> get tasks => _tasks;
  bool get isLoading => _isLoading;

  Future<void> _loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      final taskMaps = await _repository.getTasks(_taskType);
      _tasks = taskMaps.map((map) => _createTaskFromMap(map)).toList();
    } catch (e) {
      debugPrint('Error loading tasks: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  T _createTaskFromMap(Map<String, dynamic> map) {
    return createTask(
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.parse(map['dueDate'] as String),
      isCompleted: map['isCompleted'] == 1,
      priorityColor: Color(map['priorityColor'] as int),
    );
  }

  T createTask({
    required String title,
    required String description,
    required DateTime dueDate,
    bool isCompleted = false,
    Color priorityColor = Colors.grey,
  });

  Future<void> addTask(T task) async {
    try {
      await _repository.insertTask(task, _taskType);
      _tasks.add(task);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding task: $e');
    }
  }

  Future<void> removeTask(T task) async {
    try {
      await _repository.deleteTask(task.title, _taskType);
      _tasks.remove(task);
      notifyListeners();
    } catch (e) {
      debugPrint('Error removing task: $e');
    }
  }

  Future<void> updateTask(T oldTask, T newTask) async {
    try {
      await _repository.updateTask(newTask, _taskType);
      final index = _tasks.indexWhere((task) => task.title == oldTask.title);
      if (index != -1) {
        _tasks[index] = newTask;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating task: $e');
    }
  }

  Future<void> toggleTaskCompletion(T task) async {
    try {
      await _repository.toggleTaskCompletion(task.title, _taskType);
      final index = _tasks.indexWhere((t) => t.title == task.title);
      if (index != -1) {
        _tasks[index] = task.copyWith(isCompleted: !task.isCompleted) as T;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error toggling task completion: $e');
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