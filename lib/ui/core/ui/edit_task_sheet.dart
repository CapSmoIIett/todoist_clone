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
            const Expanded(child: const Text('Project of task')),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Task name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none))),
        TextField(
          decoration: InputDecoration(
            hintText: "Description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)))
      ],
    );
  }
}
