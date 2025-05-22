import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/base_task_model.dart';
import '../view_models/base_task_view_model.dart';
import 'edit_task_sheet.dart';

class BaseTaskList<T extends BaseTaskModel, V extends BaseTaskViewModel<T>> extends StatelessWidget {
  final void Function(BuildContext context, T task) onTaskTap;
  final Widget? Function(BuildContext context, T task)? trailingBuilder;

  const BaseTaskList({
    Key? key,
    required this.onTaskTap,
    this.trailingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<V>(
      builder: (context, viewModel, child) {
        return ListView.separated(
          itemCount: viewModel.tasks.length,
          itemBuilder: (context, index) {
            final task = viewModel.tasks[index];
            return Dismissible(
              key: ValueKey<String>(task.title),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                viewModel.removeTask(task);
              },
              child: ListTile(
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (bool? value) {
                    viewModel.toggleTaskCompletion(task);
                  },
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(task.description),
                trailing: trailingBuilder?.call(context, task) ?? Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: task.priorityColor,
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () => onTaskTap(context, task),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1),
        );
      },
    );
  }
} 