import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/base_task_model.dart';
import '../view_models/base_task_view_model.dart';

class BaseTaskList<T extends BaseTaskModel, V extends BaseTaskViewModel<T>> extends StatelessWidget {
  final Function(BuildContext, T) onTaskTap;

  const BaseTaskList({
    Key? key,
    required this.onTaskTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<V>(
      builder: (context, viewModel, child) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: viewModel.tasks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final task = viewModel.tasks[index];
            return Dismissible(
              key: Key(task.title),
              onDismissed: (direction) {
                viewModel.removeTask(task);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: Card(
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      viewModel.toggleTaskCompletion(task);
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (task.description.isNotEmpty) Text(task.description),
                      Text(
                        'Due: ${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: task.priorityColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onTap: () => onTaskTap(context, task),
                ),
              ),
            );
          },
        );
      },
    );
  }
} 