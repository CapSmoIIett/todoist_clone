import 'package:flutter/material.dart';
import '../../core/view_models/base_task_view_model.dart';
import '../models/inbox_task_model.dart';
import '../../../data/repositories/task_repository.dart';

class InboxViewModel extends BaseTaskViewModel<InboxTaskModel> {
  InboxViewModel(TaskRepository repository) : super(repository, 'inbox');

  @override
  InboxTaskModel createTask({
    required String title,
    required String description,
    required DateTime dueDate,
    bool isCompleted = false,
    Color priorityColor = Colors.grey,
  }) {
    return InboxTaskModel(
      title: title,
      description: description,
      dueDate: dueDate,
      isCompleted: isCompleted,
      priorityColor: priorityColor,
    );
  }
} 