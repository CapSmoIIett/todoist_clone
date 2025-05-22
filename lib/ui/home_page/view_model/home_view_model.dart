import 'package:flutter/material.dart';
import '../../core/view_models/base_task_view_model.dart';
import '../models/home_task_model.dart';

class HomeViewModel extends BaseTaskViewModel<HomeTaskModel> {
  HomeViewModel() {
    addTask(HomeTaskModel(
      title: 'Complete project',
      description: 'Finish the todo app',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      priorityColor: Colors.red,
    ));
    addTask(HomeTaskModel(
      title: 'Buy groceries',
      description: 'Milk, eggs, bread',
      dueDate: DateTime.now().add(const Duration(hours: 2)),
      priorityColor: Colors.orange,
    ));
    addTask(HomeTaskModel(
      title: 'Call mom',
      description: 'Check how she is doing',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      priorityColor: Colors.green,
    ));
  }
} 