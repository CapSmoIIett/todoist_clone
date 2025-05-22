import 'package:flutter/material.dart';
import '../../../models/base_task_model.dart';

class TodayTaskModel extends BaseTaskModel {
  const TodayTaskModel({
    required super.title,
    required super.description,
    required super.dueDate,
    super.isCompleted = false,
    super.priorityColor = Colors.grey,
  });

  @override
  TodayTaskModel copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    Color? priorityColor,
  }) {
    return TodayTaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      priorityColor: priorityColor ?? this.priorityColor,
    );
  }
} 