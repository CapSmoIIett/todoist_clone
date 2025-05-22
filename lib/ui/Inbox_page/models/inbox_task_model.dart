import 'package:flutter/material.dart';
import '../../models/base_task_model.dart';

class InboxTaskModel extends BaseTaskModel {
  const InboxTaskModel({
    required super.title,
    required super.description,
    required super.dueDate,
    super.isCompleted = false,
    super.priorityColor = Colors.red,
  });

  @override
  InboxTaskModel copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    Color? priorityColor,
  }) {
    return InboxTaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      priorityColor: priorityColor ?? this.priorityColor,
    );
  }
} 