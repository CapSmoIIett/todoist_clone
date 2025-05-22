import 'package:flutter/material.dart';
import '../../core/view_models/base_task_view_model.dart';
import '../models/inbox_task_model.dart';

class InboxViewModel extends BaseTaskViewModel<InboxTaskModel> {
  InboxViewModel() {
    addTask(InboxTaskModel(
      title: 'Inbox Task 1',
      description: 'Description for inbox task 1',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      priorityColor: Colors.red,
    ));
    addTask(InboxTaskModel(
      title: 'Inbox Task 2',
      description: 'Description for inbox task 2',
      dueDate: DateTime.now().add(const Duration(hours: 2)),
      priorityColor: Colors.orange,
    ));
    addTask(InboxTaskModel(
      title: 'Inbox Task 3',
      description: 'Description for inbox task 3',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      priorityColor: Colors.green,
    ));
  }
} 