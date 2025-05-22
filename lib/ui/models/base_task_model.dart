import 'package:flutter/material.dart';

abstract class BaseTaskModel {
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final Color priorityColor;

  const BaseTaskModel({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
    this.priorityColor = Colors.red,
  });

  BaseTaskModel copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    Color? priorityColor,
  });
} 