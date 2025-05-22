import 'package:flutter/material.dart';
import '../../core/view_models/base_task_view_model.dart';
import '../models/today_task_model.dart';
import '../../../data/repositories/task_repository.dart';

class TodayViewModel extends BaseTaskViewModel<TodayTaskModel> {
  TodayViewModel(TaskRepository repository) : super(repository, 'today');

  @override
  TodayTaskModel createTask({
    required String title,
    required String description,
    required DateTime dueDate,
    bool isCompleted = false,
    Color priorityColor = Colors.grey,
  }) {
    return TodayTaskModel(
      title: title,
      description: description,
      dueDate: dueDate,
      isCompleted: isCompleted,
      priorityColor: priorityColor,
    );
  }
} 