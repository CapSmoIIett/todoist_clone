import 'package:flutter/material.dart';
import 'package:todoist_clone/ui/core/ui/edit_task_sheet.dart';
import 'package:todoist_clone/ui/models/task_model.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            TaskModel model;
            
            //return EditTaskSheet(task: model);
            return Container();
          }),
      tooltip: 'Increment Counter',
      shape: const CircleBorder(),
      child: Icon(Icons.add),
      backgroundColor: Colors.red,
    );
  }
}
