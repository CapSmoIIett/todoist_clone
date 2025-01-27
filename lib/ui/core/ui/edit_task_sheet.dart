import 'package:flutter/material.dart';
import 'package:todoist_clone/ui/models/task_model.dart';

class EditTaskSheet extends StatelessWidget {
  EditTaskSheet({required this.task, Key? key}) : super(key: key);
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                child: const Text('Project of task')
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        Text(task.title),
        Text(task.descr)
      ],
    );
  }
}
