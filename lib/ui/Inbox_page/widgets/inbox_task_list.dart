import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/base_task_list.dart';
import '../../core/widgets/edit_task_sheet.dart';
import '../view_model/inbox_view_model.dart';
import '../models/inbox_task_model.dart';

class InboxTaskList extends StatelessWidget {
  const InboxTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTaskList<InboxTaskModel, InboxViewModel>(
      onTaskTap: (context, task) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => EditTaskSheet<InboxTaskModel>(
            task: task,
            onSave: (oldTask, newTask) {
              context.read<InboxViewModel>().updateTask(oldTask, newTask);
            },
          ),
        );
      },
    );
  }
} 